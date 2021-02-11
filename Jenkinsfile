pipeline {
  agent any
  stages {
    stage('Buzz Build') {
      steps {
        tool 'maven'
        sh 'mvn clean package'
        archiveArtifacts(artifacts: 'target/**/*.jar', allowEmptyArchive: true, fingerprint: true)
      }
    }

  }
}