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

        stage('Clean workspace'){
            step{
                cleanWs deleteDirs: true, patterns: [[pattern: '**/target', type: 'INCLUDE']]
            }
        }

        stage("Build Application"){
            step{
                //Build application using mvn
                sh '''
                    ./jenkins/docker/build/build.sh mvn -Dmaven.repo.local=$JENKINS_HOME/.m2 clean package
                '''
            }
        }

        stage("Create Image"){
            step{
                // Build docker image using Dockerfile
                sh '''
                    ./jenkins/docker/build/buildImage.sh
                '''
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