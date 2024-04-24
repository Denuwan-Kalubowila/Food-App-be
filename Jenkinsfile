pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main' url:'https://github.com/Denuwan-Kalubowila/Food-App-be'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t vishwadk/Food-App:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'test-dockerhubpassword', variable: 'test-dockerhubpassword')]) {
                    bat 'docker login -u vishwadk -p ${test-dockerhubpassword}'
                }
            }
        }
        stage('Push Image') {
            steps {
                bat 'docker push vishwadk/Food-App:%BUILD_NUMBER% .' 
            }
        }

    }
    post {
        always {
            bat 'docker logout'
        }
    }
}
