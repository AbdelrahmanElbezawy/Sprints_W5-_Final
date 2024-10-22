pipeline {
    environment {
        image = "abdelrahman66/flask"
        registryCredential = 'docker'
        dockerImage = ''

        // This can be nexus3 or nexus2
        NEXUS_VERSION = "nexus3"
        // This can be http or https
        NEXUS_PROTOCOL = "http"
        // Where your Nexus is running
        NEXUS_URL = "192.168.152.45:32000"
        // Repository where we will upload the artifact
        NEXUS_REPOSITORY = "repository/docker-hosted"
        // Jenkins credential id to authenticate to Nexus OSS
        NEXUS_CREDENTIAL_ID = "nexus"
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code
                checkout scm
            }
        }
        stage('Checkout to Subdirectory') {
            steps {
                script {
                    def changedFiles = sh(script: "git diff --name-only HEAD~1 HEAD", returnStdout: true).trim().split('\n')
                    def changesInSubdir = changedFiles.any { it.startsWith('FlaskApp/') }
                    if (!changesInSubdir) {
                        currentBuild.result = 'NOT_BUILT'
                        error("No changes in subdirectory. Skipping build.")
                    }
                }
            }
        }
        stage('Build The Image') {
            when {
                expression { currentBuild.result == null }
            }
            steps {

                script {
                    dockerImage = docker.build image + ":$BUILD_NUMBER"
                }
            }
    }
        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $image:$BUILD_NUMBER"
            }
    }   }
}
