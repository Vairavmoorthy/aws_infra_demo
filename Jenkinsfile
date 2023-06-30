pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/Vairavmoorthy/dockerdeployment.git'
      }
    }

    stage('Deploy to Remote Machine') {
      steps {
        script {
          // Define your remote machine details
          def remoteMachine = [
            name: 'RemoteMachine',
            host: '3.7.71.17',
            user: 'ubuntu',
            credentialsId: 'u112'
          ]
          
          // SSH into the remote machine
          sshagent(credentials: [remoteMachine.credentialsId]) {
            // Execute Docker login command on the remote host
            sh "ssh ${remoteMachine.user}@${remoteMachine.host} 'docker login -u <DOCKER_USERNAME> -p <DOCKER_PASSWORD> <DOCKER_REGISTRY>'"
          }
        }
      }
    }

    stage('Pull Image') {
      steps {
        // Pull the Docker image on the remote host
        script {
          def remoteMachine = [
            name: 'RemoteMachine',
            host: '3.7.71.17',
            user: 'ubuntu',
            credentialsId: 'u112'
          ]
          
          sshagent(credentials: [remoteMachine.credentialsId]) {
            sh "ssh ${remoteMachine.user}@${remoteMachine.host} 'docker pull vairav7590/vairav'"
          }
        }
      }
    }

    stage('Deploy') {
      steps {
        // Run the Docker container on the remote host
        script {
          def remoteMachine = [
            name: 'RemoteMachine',
            host: '3.7.71.17',
            user: 'ubuntu',
            credentialsId: 'u112'
          ]
          
          sshagent(credentials: [remoteMachine.credentialsId]) {
            sh "ssh ${remoteMachine.user}@${remoteMachine.host} 'docker run -d -p 9090:80 vairav7590/vairav'"
          }
        }
      }
    }
  }
}
