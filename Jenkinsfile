pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // Set your AWS region
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                     
                        sh 'terraform init'
                    
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    
                        sh 'terraform plan'
                    
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {

                        sh 'terraform apply -auto-approve'
                    
                }
            }
        }
    }
}
