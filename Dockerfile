pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerHub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/Omprakashsurwase/Assessment_deplo_appy_on_kubernetes.git' 
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t omprakash_image/nodeapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push omprakash_image/nodeapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}

