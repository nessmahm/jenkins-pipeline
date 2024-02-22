pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE_NAME = 'nessmahm/hello-app'
    }

    stages {
        stage('Pull from GitHub') {
            steps {
                git 'https://github.com/nessmahm/jenkins-pipeline.git'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:1.2")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE_NAME}:1.2").push()
                    }
                }
            }
        }
    }
}
