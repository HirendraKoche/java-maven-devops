pipeline {
  agent none
  stages {
    stage('on Java 7') {
      agent {
        node {
          label 'java7'
        }

      }
      options {
        skipDefaultCheckout()
      }
      steps {
        cleanWs(deleteDirs: true)
        checkout(scm: scm, poll: true, changelog: true)
        bat 'mvn clean package -DskipTests'
      }
    }

    stage('Test Java 7') {
      agent {
        node {
          label 'java7'
        }

      }
      options {
        skipDefaultCheckout()
      }
      post {
        success {
          powershell '''
                New-Item -ItemType Directory -Name java7
                copy-item */target/*.jar java7
                copy-item */target/*.war java7
              '''
          archiveArtifacts(allowEmptyArchive: true, artifacts: 'java7/*.jar, java7/*.war', caseSensitive: false, fingerprint: true, followSymlinks: false, onlyIfSuccessful: true)
        }

      }
      steps {
        bat 'mn test'
      }
    }

    stage('Wait for Approval') {
      steps {
        timeout(time: 1, unit: 'MINUTES') {
          input(message: 'Deploy?', ok: 'Deploy')
        }

      }
    }

    stage('Deploy Java 7') {
      agent {
        node {
          label 'java7'
        }

      }
      steps {
        echo 'Deploy Java 7 application'
      }
    }

  }
  tools {
    jdk 'jdk8'
    maven 'mvn3'
  }
  options {
    parallelsAlwaysFailFast()
  }
}