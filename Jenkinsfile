/*node{

    stage('Clean workspace'){
       cleanWs deleteDirs: true, patterns: [[pattern: 'target', type: 'INCLUDE']]
    }

    stage('CheckOut code'){
        git credentialsId: 'git-user', url: 'https://github.com/HirendraKoche/java-maven-devops.git'
    }

    stage('Build Application'){
        //Build application using mvn
        sh '''
            chmod -R +x * 
            ./jenkins/docker/build/build.sh mvn -Dmaven.repo.local=$JENKINS_HOME/.m2 clean package
        '''
    }

    stage("Create Image"){
        // Build docker image using Dockerfile
        sh '''
            ./jenkins/docker/build/buildImage.sh
        '''
    }

    stage("Push Image"){
        // Push image to docker hub.
        sh '''
            ./jenkins/docker/build/pushImage.sh
        '''
    }

}*/


pipeline{
    
    agent any

    stages{

        stage("Build Application"){
            steps{
                //Build application using mvn
                sh '''
                    bash ./jenkins/docker/build/build.sh mvn -Dmaven.repo.local=$JENKINS_HOME/.m2 clean install
                '''
            }
        }

        stage("Create Image"){
            steps{
                // Build docker image using Dockerfile
                sh '''
                    bash ./jenkins/docker/build/buildImage.sh
                '''
            }
        }

        stage("Update docker-compose and push to git"){
            steps{
                // Update docker-compose and push docker-compose to git
                sh '''
                    ./jenkins/docker/deploy/updateImageInDockerCompose.sh
                    git config --global user.email "hirendrakoche1@outlook.com"
                    git config --global user.name "hirendrakoche"
                    git add docker-compose.yml
                    git commit -am "Updated image tag in docker-compose.yml"
                    git push origin master
                '''
            }
        }

        stage('Publish Artifacts'){
            // Publish Artifacts.
            steps{
                archiveArtifacts artifacts:'**/target/*.war, **/target/*.jar', onlyIfSuccessful: true, caseSensitive: false
            }

        }

        /*stage("Push Image"){
            // Push image to docker hub.

        }*/
    }

    /*post{
        success{
            //deploy docker service
        }
    }*/
}