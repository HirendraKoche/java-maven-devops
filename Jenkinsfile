pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build 7') {
          steps {
            sh 'env'
          }
        }

        stage('Build 8') {
          steps {
            echo 'Build Java 8'
          }
        }

      }
    }

    stage('Test') {
      parallel {
        stage('Test 1') {
          steps {
            echo 'Test 1'
          }
        }

        stage('Test 2') {
          steps {
            echo 'Test 2'
          }
        }

        stage('Test 3') {
          steps {
            echo 'Test 3'
          }
        }

        stage('error') {
          steps {
            echo 'Test 4'
          }
        }

      }
    }

    stage('Code Deploy to Staging') {
      when {
        branch 'master'
      }
      steps {
        input(message: 'Deploy to Stage', ok: 'Yes, let\'s do it!')
      }
    }

    stage('Deploy to Staging') {
      when {
        branch 'master'
      }
      steps {
        echo 'Deploy to Stage'
      }
    }

  }
}