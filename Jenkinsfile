pipeline{
   
    environment{
        registry = 'hirendrakoche/java_maven_devops'
        dockerImage = ''
    }
   
    agent none

    stages{

        stage('Build App'){
            agent{
                docker{
                    image 'maven:3.5.0'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps{ sh 'mvn clean install' }
            post{
                always{ junit '**/target/surefire-reports/*.xml' }
                success{ archiveArtifacts artifacts: '**/target/*.war, **/target/*.jar', caseSensitive: false, fingerprint: true}
            }
        }

        stage('Build Docker Image'){
            agent any
            steps{
                script{
                    dockerImage = docker.build("$registry:$BUILD_NUMBER")
                }
            }
            post{
                success{ 
                    script{
                        docker.withRegistry('','docker-hub-user'){
                            dockerImage.push()
                        } 
                    }
                }
            }
        }
    }
}