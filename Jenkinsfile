pipeline {
    agent any

    stages {

        stage('Compile') {
            steps {
                echo 'Maven is compiling the code...'
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                echo 'Maven is running tests...'
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                echo 'Maven is packaging into jar...'
                sh 'mvn package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Docker is building the image...'
                sh 'docker build -t my-app:1.0 .'
            }
        }

        stage('Run Container') {
            steps {
                echo 'Docker is running the container...'
                sh 'docker stop my-app-container || true'
                sh 'docker rm my-app-container || true'
                sh 'docker run -d -p 8080:8080 --name my-app-container my-app:1.0'
            }
        }

    }

    post {
        success {
            echo 'Pipeline completed! App is running on port 8080!'
        }
        failure {
            echo 'Pipeline failed! Check the logs!'
        }
    }
}
