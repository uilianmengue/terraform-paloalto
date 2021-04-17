pipeline {
    agent any
    tools {
        terraform 'Terraform-13'
    }
    stages {
        stage('Git Checkout') {
            steps{
                git credentialsId: '394ab641-e263-4f4b-b7d5-a2b9f2ec1c17', url: 'https://github.com/uilianmengue/terraform-paloalto.git'
            }
        }
        stage('Terraform Init') {
            steps{
                sh 'ls -la'
                sh 'terraform init'
                
            }
        }
        stage('Terrform Apply') {
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}