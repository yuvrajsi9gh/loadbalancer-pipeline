pipeline {
  agent any

  environment {
    AWS_REGION = 'ap-south-1'
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/yourname/terraform-alb.git', branch: 'main'
      }
    }

    stage('Terraform Init & Apply') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'aws_creds',
          usernameVariable: 'AWS_ACCESS_KEY_ID',
          passwordVariable: 'AWS_SECRET_ACCESS_KEY'
        )]) {
          sh '''
            terraform init
            terraform apply -auto-approve
          '''
        }
      }
    }
  }
}
