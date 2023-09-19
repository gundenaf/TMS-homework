pipeline {
    agent { label 'jenkins-agent' }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/gundenaf/Project-on-Building-and-Deploying-a-Node.js-Application-with-Docker-on-Ubuntu.git', branch: 'master', credentialsId: '61bb69c1-92ab-4ffb-9732-52b16e8d05d3'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build . -t basanagoudapatil/nodo-todo-app-test:latest'
            }
        }

        stage('Test image') {
            steps {
                echo 'testing…'
                sh 'docker inspect basanagoudapatil/nodo-todo-app-test:latest'
            }
        }

        stage('Push') {
            steps {
                echo 'pushing…'
            }
        }

        stage('Deploy') {
            steps {
                echo 'deploying on another server'
                sh 'docker stop nodetodoapp || true'
                sh 'docker rm nodetodoapp || true'
                echo 'Disclaimer: it is fictional stage, container just launching. DockerHub was removed from this pipeline.'
                sh 'docker run -d --name nodetodoapp -p 8000:8000 basanagoudapatil/nodo-todo-app-test:latest'
            }
        }
  }
}