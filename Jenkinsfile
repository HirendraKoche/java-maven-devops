pipeline {
  agent none
  stages {
    stage('Build') {
      parallel {
        stage('on Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            bat 'mvn clean package -DskipTests'
          }
        }

        stage('on Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            bat 'mvn clean package -DskipTests'
          }
        }

      }
    }

    stage('Test') {
      parallel {
        stage('Test Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          options {
            skipDefaultCheckout()
          }
          steps {
            bat 'mvn test'
          }
        }

        stage('Test Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          options {
            skipDefaultCheckout()
          }
          steps {
            echo 'Test on Java 8'
            bat 'mvn test'
          }
        }

      }
    }

    stage('Archieve Artifacts') {
      parallel {
        stage('Java 7 Artifacts') {
          agent {
            node {
              label 'java7'
            }

          }
          options {
            skipDefaultCheckout()
          }
          steps {
            archiveArtifacts(allowEmptyArchive: true, artifacts: '**/target/*.jar, **/target/*.war', fingerprint: true, onlyIfSuccessful: true)
          }
        }

        stage('Java 8 Artifacts') {
          agent {
            node {
              label 'java8'
            }

          }
          options {
            skipDefaultCheckout()
          }
          steps {
            archiveArtifacts(allowEmptyArchive: true, artifacts: '**/target/*.jar, **/target/*.war', fingerprint: true, onlyIfSuccessful: true)
          }
        }

      }
    }

    stage('Wait for Approval') {
      steps {
        timeout(time: 1, unit: 'MINUTES') {
          input(message: 'Deploy?', ok: 'Deploy')
        }

      }
    }

    stage('Deploy') {
      parallel {
        stage('Deploy Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            echo 'Deploy Java 7 application'
          }
        }

        stage('Deploy Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            echo 'Deploy Java 8 application'
          }
        }

      }
    }

  }
  tools {
    jdk 'jdk8'
    maven 'mvn3'
  }
}