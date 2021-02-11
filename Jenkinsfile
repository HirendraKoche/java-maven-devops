pipeline {
  agent any
  stages {
    stage('Fluffy Build') {
      parallel {
        stage('Fluffy Build') {
          steps {
            echo 'Placeholder'
          }
        }

        stage('Fluffy Build - 1') {
          steps {
            echo 'Fluffy Build'
          }
        }

      }
    }

    stage('Fluffy Test') {
      steps {
        echo 'Fluffy Build'
      }
    }

    stage('Fluffy Deploy') {
      steps {
        echo 'Fluffy Build'
      }
    }

  }
}