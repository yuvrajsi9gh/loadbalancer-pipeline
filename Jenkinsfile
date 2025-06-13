pipeline {
    agent any

    environment {
        TF_VAR_region = 'ap-south-1'
    }

    parameters {
        booleanParam(name: 'DESTROY_INFRA', defaultValue: false, description: 'Check to destroy infrastructure')
    }

    stages {
        stage('Terraform Init & Destroy/Apply') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'aws_creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                    script {
                        sh 'terraform init'

                        if (params.DESTROY_INFRA) {
                            sh 'terraform destroy -auto-approve'
                        } else {
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
