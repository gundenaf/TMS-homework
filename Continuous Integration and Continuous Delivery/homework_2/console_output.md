```
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on jenkins-agent in /home/jenkins-agent/jenkins_slave/workspace/Jenkins_Docker_Pipeline
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Git event)
[Pipeline] echo
Pull code from Git
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage (hide)
[Pipeline] { (Pre-Build Tests)
[Pipeline] echo
Test type: syntax
[Pipeline] echo
syntax testing
[Pipeline] echo
Pre-Build actions
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build)
[Pipeline] echo
Build
[Pipeline] echo
Building with Gradle
[Pipeline] echo
Building the application
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Post-Build tests)
[Pipeline] echo
Testing with gradle
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Build Docker Image)
[Pipeline] node
Running on jenkins-docker-slave-00005kij3c4l0 on docker-agent in /home/jenkins/workspace/Jenkins_Docker_Pipeline
[Pipeline] {
[Pipeline] echo
Building Docker Image
[Pipeline] echo
docker build -t myapp:latest .
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push to Artifactory)
[Pipeline] echo
JFrog publish
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deployment)
[Pipeline] echo
deploy to ApacheWebServer
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Post-Deployment Tests)
[Pipeline] echo
integration/load/smoke tests
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] echo
One way or another, I have finished
[Pipeline] echo
Pipeline successfully completed
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```