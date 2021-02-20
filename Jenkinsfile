pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '$M2_HOME'
        sh 'mvn clean package'
      }
    }

  }
  tools {
    maven 'maven'
  }
}
