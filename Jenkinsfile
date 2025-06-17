pipeline {
    agent any

    environment {
        TF_VAR_region = 'ap-south-1'
        TF_VAR_bucket_name = 'terraform-alb-state-prinz'
        TF_VAR_dynamodb_table_name = 'terraform-alb-locks'
    }

    parameters {
        booleanParam(name: 'DESTROY_INFRA', defaultValue: false, description: 'Check to destroy infrastructure')
    }

    triggers {
        pollSCM('H/2 * * * *') // every 2 minutes
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'prod2', url: 'https://github.com/yuvrajsi9gh/loadbalancer-pipeline.git'
            }
        }

        stage('Backend Setup') {
            steps {
                dir('backend-setup') {
                    withCredentials([usernamePassword(credentialsId: 'aws_creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Terraform Init & Plan') {
            steps {
                dir('alb-deploy') {
                    withCredentials([usernamePassword(credentialsId: 'aws_creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        sh 'terraform init -input=false'
                        sh 'terraform plan -out=plan.out'
                    }
                }
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                dir('alb-deploy') {
                    withCredentials([usernamePassword(credentialsId: 'aws_creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        script {
                            if (params.DESTROY_INFRA) {
                                sh 'terraform destroy -auto-approve'
                            } else {
                                sh 'terraform apply plan.out'
                            }
                        }
                    }
                }
            }
        }
    }
}
