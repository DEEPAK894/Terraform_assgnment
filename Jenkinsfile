pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform with local backend configuration
                    sh 'terraform init'
                }
            }
        }

        // ... (other stages)

        stage('Terraform Apply') {
            steps {
                script {
                    // Run Terraform apply
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            script {
                // Cleanup resources after the job completes
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
