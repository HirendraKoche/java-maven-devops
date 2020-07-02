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
                sh 'mvn clean install'
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

                        jiraResponse = jiraNewIssue issue: newIssue, auditLog: false, site: 'jira'

                        def notify = [
                            fields: [
                                to: [
                                    assignee: true,
                                    reporter: true
                                ]
                            ]
                        ]

						jiraNotifyIssue idOrKey: jiraResponse.data.key, notify: notify, site: 'jira' 
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

        stage('Notify & Deploy'){
            agent any
            steps{
                emailext to: 'hirendrakoche1@outlook.com', subject: '$JOB_NAME #$BUILD_NUMBER: $BUILD_STATUS', body: '''Hi,\nBuild process is completed. If you wanted to deploy application, please follow below link:\n${BUILD_URL}input\nPlease follow below link for Build logs:\n${BUILD_URL}console\n\nRegards,\nJenkins Admin'''

                input id:'deploy', message:'''Build process completed successfully. Do you want to proceed for deployment.''', ok: 'Deploy', submitter: 'admin, hirendra', submitterParameter: 'Approver'

                sh './jenkins/docker/deploy/updateImageInDockerCompose.sh'

                ansiColor('xterm'){
                    ansiblePlaybook colorized: true, disableHostKeyChecking: true, extraVars: [WORKSPACE: "$WORKSPACE"]inventory: 'jenkins/docker/deploy/ansible/hosts', playbook: 'jenkins/docker/deploy/ansible/deploy.yml'
                }
            }
        }
    }
}