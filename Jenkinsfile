pipeline {
   agent any
   environment {
       DOCKERHUB_CREDENTIALS = credentials('dockerHub')
    }
   stages {
        stage('Checkout') {
            steps {
               git branch: 'main', credentialsId: 'github', url: 'https://github.com/Omprakashsurwase/Assessment_deplo_appy_on_kubernetes.git'
                sh "ls -lart ./*"
            }
        } 
         stage('Build-Image'){
            steps {
                sh "docker build -t omprakashsurwase/tomcatomimage ."
            }
         }
 stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push omprakashsurwase/tomcatomimage'
            }
        }
    }
}
