pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'docker.io/jainanant00'
        DOCKER_IMAGE = "${env.DOCKER_REGISTRY}/apache-webserver-php:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/AnantKJain/CI-CD-Pipeline-Implementation-for-a-Web-Application.git'
            }
        }
        stage('Pull Base Image') {
            steps {
                script {
                    sh 'docker pull python:3.9-slim'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'Docker-Credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy(
                        configs: 'k8s/deployment.yaml',
                        kubeconfigId: 'Kubeconfig-Credentials'
                    )
                }
            }
        }
    }
}
