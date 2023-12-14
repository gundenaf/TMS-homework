pipeline {
    agent { label 'jenkins-agent' }
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials-id')
    }
    
    parameters {
        string(name: 'DOCKERHUB_USERNAME', description: 'DockerHub Username')
        string(name: 'MINIKUBE_HOST', description: 'Minikube Host IP')
        string(name: 'MINIKUBE_PORT', description: 'Minikube Host Port')
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
                sh "sudo docker build -t ${params.DOCKERHUB_USERNAME}/frontend:latest ./frontend"
                sh "sudo docker build -t ${params.DOCKERHUB_USERNAME}/backend:latest ./backend"
                sh "sudo docker build -t ${params.DOCKERHUB_USERNAME}/database:latest ./database"
            }
        }

        stage('Post-build Tests') {
            steps {
                echo 'Running post-build tests...'
                sh "sudo docker inspect ${params.DOCKERHUB_USERNAME}/frontend:latest"
                sh "sudo docker inspect ${params.DOCKERHUB_USERNAME}/backend:latest"
                sh "sudo docker inspect ${params.DOCKERHUB_USERNAME}/database:latest"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                // Authenticate Docker with Docker Hub using Jenkins credentials
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
                echo 'Pushing Docker images to Docker Hub...'

                sh "sudo docker tag ${params.DOCKERHUB_USERNAME}/backend:latest ${params.DOCKERHUB_USERNAME}/backend:1.0.0"
                sh "sudo docker tag ${params.DOCKERHUB_USERNAME}/frontend:latest ${params.DOCKERHUB_USERNAME}/frontend:1.0.0"
                sh "sudo docker tag ${params.DOCKERHUB_USERNAME}/database:latest ${params.DOCKERHUB_USERNAME}/database:1.0.0"

                sh "sudo docker push ${params.DOCKERHUB_USERNAME}/backend:latest"
                sh "sudo docker push ${params.DOCKERHUB_USERNAME}/frontend:latest"
                sh "sudo docker push ${params.DOCKERHUB_USERNAME}/database:latest"
            }    
        }


        stage('Deploy to Minikube') {
            steps {
                script {
                    def minikubeHost = params.MINIKUBE_HOST
                    def minikubePort = params.MINIKUBE_PORT
                    def dockerhubUsername = params.DOCKERHUB_USERNAME
                    sshagent (credentials: ['minikube-vm-id']) {
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} minikube stop"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} minikube delete"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} rm -rf TMS-homework"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} git clone https://github.com/gundenaf/TMS-homework.git"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} minikube start --listen-address='0.0.0.0'"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} docker pull ${dockerhubUsername}/frontend:latest"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} docker pull ${dockerhubUsername}/backend:latest"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} docker pull ${dockerhubUsername}/database:latest"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} kubectl apply -f TMS-homework/Thesis/k8s/namespaces/namespace.yml"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} kubectl apply -f TMS-homework/Thesis/k8s/networks/network.yml"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} kubectl apply -f TMS-homework/Thesis/k8s/manifests/db-deployment.yml"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} kubectl apply -f TMS-homework/Thesis/k8s/manifests/backend-deployment.yml"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} kubectl apply -f TMS-homework/Thesis/k8s/manifests/frontend-deployment.yml"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} kubectl wait --for=condition=Ready pod --all -n react-nodejs-postgresql-app --timeout=300s"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} 'nohup kubectl port-forward --address 0.0.0.0 service/backend-service --namespace=react-nodejs-postgresql-app 4000:4000 > /dev/null 2>&1 &'"
                        sh "ssh -o StrictHostKeyChecking=no -p ${minikubePort} minikube@${minikubeHost} 'nohup kubectl port-forward --address 0.0.0.0 service/frontend-service --namespace=react-nodejs-postgresql-app 3000:3000 > /dev/null 2>&1 &'"
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