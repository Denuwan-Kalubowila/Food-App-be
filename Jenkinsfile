pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/Denuwan-Kalubowila/Food-App-be'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t vishwadk/food-app:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'test-pass', variable: 'testpass')]) {
                    script {
                        bat "docker login -u vishwadk -p %testpass%"
                    }
                }
            }
        }
    }
}
