pipeline {
    agent { label 'jenkins-agent' }

    environment {
        DOCKERHUB_USERNAME = 'gundenaf'
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials-id')
        KUBE_NAMESPACE = 'react-nodejs-postgresql-app'
        KUBE_SERVICE_NAME_BACKEND = 'backend-service'
        KUBE_SERVICE_NAME_FRONTEND = 'frontend-service'
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
                    checkout([$class: 'GitSCM', 
                              branches: [[name: '*/main']], 
                              userRemoteConfigs: [[url: 'https://github.com/gundenaf/TMS-homework.git']]])
                }

                echo "sh 'cd Thesis'"

                echo 'Deploying to Minikube...'

                // Start Minikube
                sh 'minikube start'

                // Use Minikube context
                sh 'kubectl config use-context minikube'

                // Pull Docker images from ECR
                sh 'eval \$(minikube docker-env)' // Set Minikube Docker environment
                sh "docker pull $DOCKERHUB_USERNAME/frontend:latest"
                sh "docker pull $DOCKERHUB_USERNAME/backend:latest"
                sh "docker pull $DOCKERHUB_USERNAME/database:latest"

                // Apply Kubernetes configuration
                sh 'kubectl apply -f k8s/namespaces/namespace.yml'
                sh 'kubectl apply -f k8s/networks/network.yml'
                sh 'kubectl apply -f k8s/manifests/db-deployment.yml'
                sh 'kubectl apply -f k8s/manifests/backend-deployment.yml'
                sh 'kubectl apply -f k8s/manifests/frontend-deployment.yml'

                // Port forward for backend service
                sh "kubectl port-forward service/$KUBE_SERVICE_NAME_BACKEND --namespace=$KUBE_NAMESPACE 4000:4000 &"

                // Port forward for frontend service
                sh "kubectl port-forward service/$KUBE_SERVICE_NAME_FRONTEND --namespace=$KUBE_NAMESPACE 3000:3000 &"
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