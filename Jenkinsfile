pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE_NAME = 'nessmahm/hello-app'
    }

    stages {
        stage('Pull from GitHub') {
            steps {
                   git branch: 'main', url: 'https://github.com/nessmahm/jenkins-pipeline.git'

            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:1.3")
                }
            }
        }
        stage('Login to Docker Hub') {      	
            steps{  
                withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
        	    sh 'docker login -u nessmahm -p ${dockerhubpwd}'
                echo 'Login Completed'     
             } 
            }
        }

       stage('Push Image to Docker Hub') {         
            steps{       
                 sh 'docker push ${DOCKER_IMAGE_NAME}:1.3'           
                 echo 'Push Image Completed'       
            }            
        }  
    }
}
