pipeline {
  agent any
  stages {
    stage('Build Code') {
      post {
        success {
          archiveArtifacts(allowEmptyArchive: true, artifacts: '**/target/*.jar,**/target/*.war', fingerprint: true, followSymlinks: false, onlyIfSuccessful: true)
        }

        always {
          junit(allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml')
          jacoco(classPattern: '**/target/classes', inclusionPattern: '**/**.exec')
        }

      }
      parallel {
        stage('Build with Java8') {
          steps {
            bat 'mvn clean package'
          }
        }

      }
    }

    stage('Wait for Approval') {
      options {
        timeout(time: 15, unit: 'SECONDS')
      }
      steps {
        input(message: 'Package is Ready to Deploy. Shall I deploy it?', ok: 'Ok. Let\'s do it!')
      }
    }

    stage('Deploy') {
      when {
        branch 'master'
      }
      steps {
        echo 'Code Deployeed successfully.'
      }
    }

  }
  tools {
    maven 'mvn3'
    jdk 'jdk8'
  }
  parameters {
    string(defaultValue: 'DEV', description: 'Environment name on which deployment will be initiated.', name: 'DEPLOY_TO', trim: false)
  }
}