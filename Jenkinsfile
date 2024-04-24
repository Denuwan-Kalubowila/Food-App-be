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
                withCredentials([string(credentialsId: 'test-docker', variable: 'test-docker')]) {
                    scripts {
                        bat 'docker login -u vishwadk -p ${test-docker}'
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                bat 'docker push vishwadk/food-app:%BUILD_NUMBER% .' 
            }
        }

    }
    post {
        always {
            bat 'docker logout'
        }
    }   
}
