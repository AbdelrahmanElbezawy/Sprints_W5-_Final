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
        stage('Cloning our Git') {
            steps {
                checkout scm
               // git 'https://github.com/YourGithubAccount/YourGithubRepository.git'
            }
        }
        stage('Building our image') {
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
}
