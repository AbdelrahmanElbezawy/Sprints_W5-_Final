pipeline {
    environment {
        //BRANCH_NAME
   //     EMAIL_RECIPIENTS = 'elbezawy.abdelrahman@gmail.com'
        image = "depi/flask"
    //    registryCredential = 'git'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                rm -rf *
                // Checkout the code
                checkout scm
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
        stage('Build') {
            when {
                expression { currentBuild.result == null }
            }
            steps {
                //sh 'rm -rf *'
                sh 'ls -la'
                script {
                    // Navigate to the subdirectory and run the build steps
                    dir('FlaskApp/') {
                        sh 'ls -la'  // Example: List files in the subdirectory to verify checkout
                        sh './text.sh'  // Example: Run your build script from the subdirectory
                    }
                }
            }
        
 //       stage('Cloning our Git') {
 //           steps {
 //               checkout scm
 //              // git 'https://github.com/YourGithubAccount/YourGithubRepository.git'
 //           }
 //       }
 //       stage('Building our image') {
 //           steps {
 //               script {
 //                   dockerImage = docker.build image + ":$BUILD_NUMBER"
 //               }
 //           }
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
}
