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
                // Checkout the code
                checkout scm
            }
        }
        stage('Checkout to Subdirectory') {
            steps {
           //      dir('./FlaskApp') {
           //     // This creates a directory named project-app in the current directory and initializes this directory as a git repository 
           //     // and as the current directory for sh commands.
           //     checkout scmGit(branches: [[name: "main"]], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/AbdelrahmanElbezawy/Sprints_W5-_Final.git']])
           //     sh 'ls -l'
           //     }
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

                script {
                    // Navigate to the subdirectory and run the build steps
                    dir('FlaskApp/') {
                        sh 'ls -la'  // Example: List files in the subdirectory to verify checkout
                        dockerImage = docker.build image + ":$BUILD_NUMBER"
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
