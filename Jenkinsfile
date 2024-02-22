pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub_id')
        DOCKER_IMAGE_NAME = 'nessmahm/hello-app'
    }

    stages {
        stage('Pull from GitHub') {
            steps {
                git 'https://github.com/your-username/your-repository.git'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
