pipeline {
  agent any
  stages {
    stage('Initialize') {
      steps {
        sh '''echo "Maven Version: $(mvn version)"
echo "Path --> $PATH"
echo "M2_Home --> $M2_HOME"'''
      }
    }

  }
  tools {
    maven 'maven'
  }
}