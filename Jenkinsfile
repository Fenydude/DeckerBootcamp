pipeline {
    agent { label 'docker-agent1' }
    triggers {
            pollSCM('H/2 * * * *') // Проверяет изменения каждые 5 минут
    }

    tools {
            maven 'Maven'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'mvn clean compile'
                }
            }
        }

        stage('Checkstyle') {
            steps {
                script {
                    sh 'mvn checkstyle:check'
                }
            }
        }

        stage('SpotBugs') {
            steps {
                script {
                    sh 'mvn spotbugs:check'
                }
            }
        }

        stage('Dependency-Check') {
            steps {
                script {
                    sh 'mvn org.owasp:dependency-check-maven:check'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'mvn test'
                }
            }
        }
    }

    post {
        failure {
            echo 'Build failed due to violations in Checkstyle, SpotBugs, or Dependency-Check.'
        }

        success {
            echo 'Build completed successfully with no violations.'
        }
    }
}
