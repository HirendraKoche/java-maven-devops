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
            bat 'mn clean package -DskipTests'
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
          post {
            success {
              powershell '''
                New-Item -ItemType Directory -Name java7
                copy-item */target/*.jar java7
                copy-item */target/*.war java7
              '''
              archiveArtifacts(allowEmptyArchive: true, artifacts: 'java7/*.jar, java7/*.war', caseSensitive: false, fingerprint: true, followSymlinks: false, onlyIfSuccessful: true)
            }

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
          post {
            success {
              powershell '''
                New-Item -ItemType Directory -Name java8
                copy-item */target/*.jar java8
                copy-item */target/*.war java8
              '''
              archiveArtifacts(allowEmptyArchive: true, artifacts: 'java8/*.jar, java8/*.war', caseSensitive: false, fingerprint: true, followSymlinks: false, onlyIfSuccessful: true)
            }

          }
          steps {
            echo 'Test on Java 8'
            bat 'mvn test'
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
  options {
    parallelsAlwaysFailFast()
  }
}