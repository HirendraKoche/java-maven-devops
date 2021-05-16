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
        bat 'mvn clean compile'
      }
    }
  }
}
