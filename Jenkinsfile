pipeline {
  agent none
  options {
    skipDefaultCheckout()
  }
  
  stages {
    stage('Build'){
      agent{
        label 'windows'
      }
      tools {
        jdk 'jdk8'
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
