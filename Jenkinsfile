pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/aws_demo.git'
            }
        }

        stage('Destroy executed') {
            steps {
                withAWS(credentials: '112') {
                    sh 'terraform destroy -auto-approve '
                   
                   
                }
            }
        }

        stage('Infrastructure destroyed') {
            steps {
                sh 'echo "destroying instance"'
                // Add commands or scripts to create the instance using desired tool/API
            }
        }
    }
}
