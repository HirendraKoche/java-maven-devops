pipeline{
   
    environment{
        registry = 'hirendrakoche/java_maven_devops'
        dockerImage = ''
    }
   
    agent none

    stages{

        stage('Build App'){
            agent{
                docker{
                    image 'maven:3.5.0'
                    args '-v $JENKINS_HOME/.m2:/root/.m2'
                }
            }
            steps{ 
                sh 'mvn clean insta'
            }

            post{
                always{ junit '**/target/surefire-reports/*.xml' }
                
                success{ archiveArtifacts artifacts: '**/target/*.war, **/target/*.jar', caseSensitive: false, fingerprint: true}
                
                failure{
                    script{
                        def newIssue = [
                            fields: [
                                project: [ key: 'JAVA' ],
                                summary: "$JOB_NAME #$BUILD_NUMBER : FAILED",
                                description: "Build failed. Please check logs at ${BUILD_URL}console",
                                issuetype: [ name: 'Bug' ],
                                priority: [ name: 'High' ],
                                components: [[ name: 'FrontEnd' ]]
                            ]
                        ]

                        jiraResponse = jiraNewIssue issue: newIssue, site: 'jira'

						jiraNotifyIssue idOrKey: jiraResponse.data.key, notify: 'Failure', site: 'jira' 
                    }
                }
            }
        }

        stage('Build Docker Image'){
            agent any
            steps{
                script{
                    dockerImage = docker.build("$registry:$BUILD_NUMBER")
                }
            }
            post{
                success{ 
                    script{
                        docker.withRegistry('','docker-hub-user'){
                            dockerImage.push()
                        } 
                        sh "docker image rm ${dockerImage.id}"
                    }
                }
            }
        }
    }
    post{
        success{
            emailext to: 'hirendrakoche1@outlook.com', subject: '$JOB_NAME #$BUILD_NUMBER: $BUILD_STATUS', body: '''Hi,
            Build process is completed. If you wanted to deploy application, please follow below link:
            ${BUILD_URL}input
            Please follow below link for Build logs:
            ${BUILD_URL}console
            '''

            input id:'deploy', message:'''Build process completed successfully. Do you want to proceed for deployment.''', ok: 'Deploy', submitter: 'admin, hirendra', submitterParameter: 'Approver'
        }
    }
}