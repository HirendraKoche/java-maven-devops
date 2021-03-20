pipeline {
	agent any
	
	tools {
		maven 'maven 3.3.9'
		error
	}
	
	parameters {
		string defaultValue: 'DEV', description: 'Environment name on which deployment will be initiated.', name: 'DEPLOY_TO', trim: false
	}
  
	stages {
		stage("Build Code") {
			parallel {
				stage("Build with Java8") {
					tools {
						maven 'maven 3.3.9'
						jdk 'java8'
					}
					steps {
						sh 'mvn clean package'
					}
				}
				stage("Build with Java9") {
					tools {
						jdk 'java9'
						maven 'maven 3.3.9'
					}
					steps {
						sh 'mvn clean package'
					}
				}
			}
			post {
				success {
					archiveArtifacts allowEmptyArchive: true, artifacts: '**/target/*.jar,**/target/*.war', fingerprint: true, followSymlinks: false, onlyIfSuccessful: true
				}
				always {
					junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
					jacoco classPattern: '**/target/classes', inclusionPattern: '**/**.exec'
				}
			}
		}
		
		stage("Wait for Approval") {
			agent none
			
			options {
				timeout(time: 15, unit: 'SECONDS')
			}
			
			steps {
				input message: 'Package is Ready to Deploy. Shall I deploy it?', ok: 'Ok. Let\'s do it!'
			}
		}
		
		stage("Deploy") {
			when {
				branch 'master'
			}
			
			steps {
				echo "Code Deployeed successfully."
			}
		}
	}
}
