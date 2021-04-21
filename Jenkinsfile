pipeline {
  agent none
  stages {
    stage('Build') {
      parallel {
        stage('on Java 7') {
          agent any
          steps {
            echo 'Build on agent Java 7'
          }
        }

        stage('on Java 8') {
          agent any
          steps {
            echo 'Build on agent Java 8'
          }
        }

      }
    }

    stage('Test') {
      parallel {
        stage('Test Java 7') {
          agent any
          steps {
            echo 'Test for agent Java 7'
          }
        }

        stage('Test Java 8') {
          agent any
          steps {
            echo 'Test on Java 8'
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
          agent any
          steps {
            echo 'Deploy Java 7 application'
          }
        }

        stage('Deploy Java 8') {
          agent any
          steps {
            echo 'Deploy Java 8 application'
          }
        }

      }
    }

  }
}