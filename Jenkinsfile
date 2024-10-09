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
        stage('Checkout to Subdirectory') {
            steps {
                script {
                    // Check out the code into a subdirectory called "my_subdirectory"
                    dir('FlaskApp/') {
                        checkout([
                            $class: 'GitSCM',
                            branches: [[name: '*/main']],
                            userRemoteConfigs: [[url: 'https://github.com/AbdelrahmanElbezawy/Sprints_W5-_Final.git']]
                        ])
                    }
                }
            }
        }
        stage('Build') {

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
