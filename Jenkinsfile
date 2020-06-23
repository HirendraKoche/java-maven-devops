pipeline{
    
    agent any

    stages{
        stage("Build Application"){
            //Build application using mvn

        }

        stage("Test Application"){
            // Run test cases using mvn

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