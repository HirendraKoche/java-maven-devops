pipeline {
  agent any
  options {
    skipDefaultCheckout()
  }
  
  stages {
    stage('Build'){
      agent{
        label 'windows'
      }
      tools {
        maven 'mvn3'
      }
      steps {
        deleteDir()
        checkout scm
        sh 'mvn clean compile'
      }
    }
  }
}
