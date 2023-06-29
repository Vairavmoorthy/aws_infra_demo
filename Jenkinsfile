pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/aws_demo.git'
            }
        }

        stage('Build Infrastructure') {
            steps {
                withAWS(credentials: '112') {
                    sh 'terraform destroy -auto-approve '
                   
                   
                }
            }
        }

        stage('Create destroy') {
            steps {
                sh 'echo "destroying instance"'
                // Add commands or scripts to create the instance using desired tool/API
            }
        }
    }
}
