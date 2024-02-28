pipeline {
    agent any

    tools {
        maven 'MAVEN3'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    bat 'mvn clean install'
                }
            }
        }
        // Add more stages as needed
    }
}
