pipeline {
  agent any
  stages {
    stage('Buzz Build') {
      steps {
        tool(name: 'maven', type: 'mvn clean package')
        archiveArtifacts(artifacts: 'target/**/*.jar', allowEmptyArchive: true, fingerprint: true)
      }
    }

  }
}