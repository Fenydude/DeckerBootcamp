pipeline {
    agent any
    tools {
                maven 'Maven' // Используйте имя, которое вы указали при добавлении Maven
    }

    stages {
        stage('Checkout') {
            steps {
                // Клонирование репозитория
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Запускаем сборку проекта
                    sh 'mvn clean compile'
                }
            }
        }

        stage('Checkstyle') {
            steps {
                script {
                    // Запуск Checkstyle
                    sh 'mvn checkstyle:check'
                }
            }
        }

        stage('SpotBugs') {
            steps {
                script {
                    // Запуск SpotBugs
                    sh 'mvn spotbugs:check'
                }
            }
        }

        stage('Dependency-Check') {
            steps {
                script {
                    // Запуск Dependency-Check
                    sh 'mvn org.owasp:dependency-check-maven:check'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Запуск тестов, если они есть
                    sh 'mvn test'
                }
            }
        }
    }

    post {
        // Отмечаем сборку как неудачную, если есть ошибки на любом этапе
        failure {
            echo 'Build failed due to violations in Checkstyle, SpotBugs, or Dependency-Check.'
        }

        // Отмечаем сборку как успешную, если все прошло
        success {
            echo 'Build completed successfully with no violations.'
        }
    }
}
