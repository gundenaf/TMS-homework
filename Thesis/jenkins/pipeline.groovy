pipeline {
    agent { label 'jenkins-agent' }

    environment {
        DOCKERHUB_USERNAME = 'gundenaf'
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials-id')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', 
                              branches: [[name: '*/main']], 
                              userRemoteConfigs: [[url: 'https://github.com/gundenaf/react-nodejs-postgresql-app.git']]])
                }
            }
        }

        stage('Pre-build Tests') {
            steps {
                echo 'Running lint tests for backend...'
                echo "sh 'cd backend && npm install && npm run lint && cd ..'"

                echo 'Running lint tests for frontend...'
                echo "sh 'cd frontend && npm install && npm run lint && cd ..'"
            }
        }

        stage('Build Docker Images') {
            steps {
                echo 'Building Docker images...'

                // Build the Docker images for frontend, backend, and database
                sh "sudo docker build -t $DOCKERHUB_USERNAME/frontend:latest ./frontend"
                sh "sudo docker build -t $DOCKERHUB_USERNAME/backend:latest ./backend"
                sh "sudo docker build -t $DOCKERHUB_USERNAME/database:latest ./database"
            }
        }

        stage('Post-build Tests') {
            steps {
                echo 'Running post-build tests...'
                sh "sudo docker inspect $DOCKERHUB_USERNAME/frontend:latest"
                sh "sudo docker inspect $DOCKERHUB_USERNAME/backend:latest"
                sh "sudo docker inspect $DOCKERHUB_USERNAME/database:latest"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Authenticate Docker with Docker Hub using Jenkins credentials
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
                echo 'Pushing Docker images to Docker Hub...'

                sh "sudo docker tag $DOCKERHUB_USERNAME/backend:latest $DOCKERHUB_USERNAME/backend:1.0.0"
                sh "sudo docker tag $DOCKERHUB_USERNAME/frontend:latest $DOCKERHUB_USERNAME/frontend:1.0.0"
                sh "sudo docker tag $DOCKERHUB_USERNAME/database:latest $DOCKERHUB_USERNAME/database:1.0.0"

                sh "sudo docker push $DOCKERHUB_USERNAME/backend:latest"
                sh "sudo docker push $DOCKERHUB_USERNAME/frontend:latest"
                sh "sudo docker push $DOCKERHUB_USERNAME/database:latest"
            }    
        }


        stage('Deploy to Minikube') {
            steps {
                script {
                    sshagent (credentials: ['minikube-vm-id']) {
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP minikube stop'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP minikube delete'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP rm -rf TMS-homework'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP git clone https://github.com/gundenaf/TMS-homework.git'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP minikube start --listen-address='0.0.0.0''
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP docker pull gundenaf/frontend:latest'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP docker pull gundenaf/backend:latest'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP docker pull gundenaf/database:latest'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl apply -f TMS-homework/Thesis/k8s/namespaces/namespace.yml'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl apply -f TMS-homework/Thesis/k8s/networks/network.yml'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl apply -f TMS-homework/Thesis/k8s/manifests/db-deployment.yml'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl apply -f TMS-homework/Thesis/k8s/manifests/backend-deployment.yml'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl apply -f TMS-homework/Thesis/k8s/manifests/frontend-deployment.yml'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl port-forward service/backend-service --namespace=react-nodejs-postgresql-app 4000:4000 &'
                        sh 'ssh -o StrictHostKeyChecking=no -p 47583 minikube@minikube_IP kubectl port-forward service/frontend-service --namespace=react-nodejs-postgresql-app 3000:3000 &'
                    }
                }
            }
        }

        stage('Post-deploy Tests') {
            steps {
                echo 'Running post-deploy tests...'
                // Add your post-deploy tests here
            }
        }
    }

    post {
        always {
            echo 'CI/CD Pipeline has completed.'
        }
        success {
            echo 'CI/CD Pipeline successfully executed. Great job!'
        }
        failure {
            echo 'CI/CD Pipeline encountered errors. Check the logs for details.'
        }
        changed {
            echo 'Pipeline results have changed since the last run.'
        }
    }
}