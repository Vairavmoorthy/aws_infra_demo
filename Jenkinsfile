pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vairavmoorthy/aws_infra_demo.git'
            }
        }

        stage('Destroy executed') {
            steps {
                withAWS(credentials: '112') {
                    //sh 'terraform init'
                    sh 'terraform destroy -parallelism=6 -auto-approve'
                   
                   
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
