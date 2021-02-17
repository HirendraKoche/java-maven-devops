pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build 7') {
          steps {
            sh '''COMMIT="${GIT_COMMIT:0:7}"

echo Branch: $GIT_BRACH, Commit: $COMMIT'''
            echo "Finished run for commit ${ env.GIT_COMMIT.substring(0,6) }"
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