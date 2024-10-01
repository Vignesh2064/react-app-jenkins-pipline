pipeline {
    agent any 

    environment {
        // Set Docker image name
        DOCKER_IMAGE_NAME = 'my-react-app'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository from GitHub
                git url: 'https://github.com/Vignesh2064/react-app-jenkins-pipline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run any tests here. For example, you could run unit tests using npm
                    sh "npm run test"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh """
                        docker stop ${DOCKER_IMAGE_NAME} || true
                        docker rm ${DOCKER_IMAGE_NAME} || true
                        docker run -d -p 80:80 --name ${DOCKER_IMAGE_NAME} ${DOCKER_IMAGE_NAME}
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for errors.'
        }
    }
}
