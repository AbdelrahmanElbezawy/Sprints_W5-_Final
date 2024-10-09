pipeline {
    environment {
        //BRANCH_NAME
   //     EMAIL_RECIPIENTS = 'elbezawy.abdelrahman@gmail.com'
        image = "depi/flask"
    //    registryCredential = 'git'
        dockerImage = ''
    }
    agent any
 //   	options { 
//		checkoutToSubdirectory('Sprints_W5-_Final/FlaskApp') 
//	}
    stages {

        stage('Build') {

            steps {
                sh 'ls -la'
                script {
                    // Navigate to the subdirectory and run the build steps
                    dir('Sprints_W5-_Final/FlaskApp') {
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
