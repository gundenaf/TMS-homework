pipeline {
    agent { label 'docker'}
    parameters {
        string(name: "TEST_STRING", defaultValue: "syntax testing", description: "Sample string parameter")
    }

    stages {
        stage ('Git event') {
            steps {
                echo 'Pull code from Git'
            }
        } 

        stage('Pre-Build Tests') {
            steps {
                echo 'Test type: syntax'
                echo "${params.TEST_STRING}"
                echo "Pre-Build actions"
            }
        }

        stage('Build') {
            steps {
                echo 'Build'
                echo 'Building with Gradle'
                echo "Building the application"
            }
        }

        stage ('Post-Build tests') {
            steps {
                echo 'Testing with gradle'
            }
        }  

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image'
                echo 'docker build -t myapp:latest .'
            }
        }

        stage ('Push to Artifactory') {
            steps {
                echo 'JFrog publish'
            }
        }

        stage ('Deployment') {
            steps {
                echo 'deploy to ApacheWebServer'
            }
        }   

        stage ('Post-Deployment Tests') {
            steps {
                echo 'integration/load/smoke tests'
            }
        }          

    }

    post {
        always {
            echo 'One way or another, I have finished'
        }
        success {
            echo 'Pipeline successfully completed'
        }
        failure {
            echo 'Pipeline completed with errors'
        }
        changed {
            echo 'Things were different before...'
        }
    }
}