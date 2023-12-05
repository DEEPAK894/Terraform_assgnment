pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-2' // Set your AWS region
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    withAWS(region: AWS_REGION, credentials: 'aws') {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withAWS(region: AWS_REGION, credentials: 'aws') { 
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    withAWS(region: AWS_REGION, credentials: 'aws') {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
