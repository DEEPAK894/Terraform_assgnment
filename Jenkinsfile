pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID     = credentials('AKIATK6MJJCY6E3DHHMN')
        AWS_SECRET_ACCESS_KEY = credentials('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')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        credentialsId: 'aws'
                    ]]) {
                        // Initialize Terraform with AWS provider credentials
                        sh 'terraform init'
                    }
                }
            }
        }
        stage('Terraform plan') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        credentialsId: 'aws'
                    ]]) {
                        // Run Terraform apply
                        sh 'terraform plan '
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        credentialsId: 'aws'
                    ]]) {
                        // Run Terraform apply
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        // ... (other stages)

        stage('Terraform Destroy') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        credentialsId: 'aws'
                    ]]) {
                        // Destroy Terraform resources
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
