pipeline {
  agent any
  stages {
    stage('Check CREDS details') {
      steps {
        echo "Service user - ${GIT_CRDS_USR}"
        echo "Service user passwrod - ${GIT_CRDS_PSW}"
      }
    }

  }
  environment {
    GIT_CRDS = credentials('gituser')
  }
}