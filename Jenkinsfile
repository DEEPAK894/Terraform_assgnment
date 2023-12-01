pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
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
                        accessKeyVariable: 'AKIAUBHJPDFRRHRS2MNH',
                        secretKeyVariable: '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',
                        credentialsId: 'Terraform'
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
                        accessKeyVariable: 'AKIAUBHJPDFRRHRS2MNH',
                        secretKeyVariable: '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',
                        credentialsId: 'Terraform'
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
                        accessKeyVariable: 'AKIAUBHJPDFRRHRS2MNH',
                        secretKeyVariable: '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',
                        credentialsId: 'Terraform'
                    ]]) {
                        // Destroy Terraform resources
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
