pipeline {
    agent any

    tools {
        maven 'MAVEN3'
    }

     stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Code Coverage') {
            steps {
                bat 'mvn jacoco:report'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t myapp .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubLogin', usernameVariable: 'gxiong1', passwordVariable: 'comp367pass')]) {
                    bat 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                }
            }
        }

        stage('Docker Push') {
            steps {
                bat 'docker push myapp'
            }
        }
    }
}
