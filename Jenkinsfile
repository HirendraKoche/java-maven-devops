pipeline {
  agent any
  stages {
    stage('Buzz Build') {
      steps {
        archiveArtifacts(artifacts: 'my-app.zip', fingerprint: true, allowEmptyArchive: true)
        archiveArtifacts(artifacts: 'images/*.png', allowEmptyArchive: true, fingerprint: true)
        archiveArtifacts(artifacts: 'target/**/*.jar', allowEmptyArchive: true, fingerprint: true)
      }
    }

  }
}