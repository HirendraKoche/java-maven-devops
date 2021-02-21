pipeline {
	agent any
	
	tools {
		maven 'maven 3.3.9'
	}
	
	stages {
		stage("Build Code") {
			parallel {
				stage("Build with Java8") {
					tools {
						jdk 'java8'
					}
					steps {
						sh 'mvn clean package'
					}
				}
				stage("Build with Java9") {
					tools {
						jdk 'java9'
					}
					steps {
						sh 'mvn clean package'
					}
				}
			}
			post {
				success {
					archiveArtifacts allowEmptyArchive: true, artifacts: '**/target/*.jar, **/target/*.war', fingerprint: true, followSymlinks: false, onlyIfSuccessful: true
				}
				always {
					junit allowEmptyResults: true, testResults: '**/target/surefire-reports/*.xml'
				}
			}
		}	
		
	}
}
