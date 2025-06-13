pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    AWS_REGION            = 'ap-south-1'
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/yuvrajsi9gh/loadbalancer-pipeline'
      }
    }

    stage('Terraform Init & Apply') {
      steps {
        sh 'terraform init -reconfigure'
        sh 'terraform plan -out=tfplan'
        sh 'terraform apply -auto-approve tfplan'
      }
    }
  }
}
