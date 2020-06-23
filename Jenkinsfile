pipeline{
    
    agent any

    stages{
        stage("Build Application"){
            //Build application using mvn
            sh '''
                ./jenkins/docker/build/build.sh mvn -Dmaven.repo.local=$JENKINS_HOME/.m2 clean package
            '''
        }

        stage("Test Application"){
            // Run test cases using mvn
            sh '''
                ./jenkins/docker/build/build.sh mvn -Dmaven.repo.local=$JENKINS_HOME/.m2 test
            '''
        }

        stage("Create Image"){
            // Build docker image using Dockerfile

        }

        stage("Push Image"){
            // Push image to docker hub.

        }
    }

    post{
        success{
            //deploy docker service
        }
    }
}