pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/aws_infra_demo.git'
            }
        }

        stage('Build Infrastructure') {
            steps {
                withAWS(credentials: '112') {
                    sh 'terraform init'
                   // sh 'terraform plan -out=tfplan'
                    sh 'terraform apply -parallelism=10 -auto-approve'
                }
            }
        }

        stage('Create Infrastructure') {
            steps {
                sh 'echo "Creating jenkins Instance"'
                
            }
        }
    }
}
