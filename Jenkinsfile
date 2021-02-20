pipeline {
  agent any
  stages {
    stage('Initialize') {
      steps {
        sh '''gradle -v
              echo "$PATH"
           '''
      }
    }

  }
  tools {
    gradle 'gradle'
  }
}
