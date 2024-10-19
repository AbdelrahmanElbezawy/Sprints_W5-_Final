pipeline {
    environment {
<<<<<<< HEAD
        //BRANCH_NAME
   //     EMAIL_RECIPIENTS = 'elbezawy.abdelrahman@gmail.com'
        image = "abdelrahman66/flask"
        registryCredential = 'git'
=======
        image = "depi/flask"
    //    registryCredential = 'git'
>>>>>>> c11f2c40eed9a62df8fec17555f3e1de3a0035da
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
<<<<<<< HEAD
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
=======
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
>>>>>>> c11f2c40eed9a62df8fec17555f3e1de3a0035da
        //stage('Cleaning up') {
        //    steps {
        //        sh "docker rmi $image:$BUILD_NUMBER"
        //    }
    }   //}
}
