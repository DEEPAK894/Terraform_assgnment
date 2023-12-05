pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-2'
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
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIATK6MJJCYYMADR2GU',
                        secretKeyVariable: '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',
                        credentialsId: 'Terraform_new'
                    ]]) {
                        // Initialize Terraform with AWS provider credentials
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Use withCredentials to securely pass AWS credentials
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIATK6MJJCYYMADR2GU',
                        secretKeyVariable: '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',
                        credentialsId: 'Terraform_new'
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
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIATK6MJJCYYMADR2GU',
                        secretKeyVariable: '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',
                        credentialsId: 'Terraform_new'
                    ]]) {
                        // Destroy Terraform resources
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
