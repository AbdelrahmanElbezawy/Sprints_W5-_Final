pipeline {
    environment {
        image = "depi/flask"
    //    registryCredential = 'git'
        dockerImage = ''
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
        //stage('Deploy our image') {
        //    steps {
        //        script {
        //            docker.withRegistry( '', registryCredential ) {
        //                dockerImage.push()
        //            }
        //        }
        //    }
        //}
        //stage('Cleaning up') {
        //    steps {
        //        sh "docker rmi $image:$BUILD_NUMBER"
        //    }
        //}
}
