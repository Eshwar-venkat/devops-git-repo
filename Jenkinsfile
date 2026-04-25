pipeline {
    agent any

    environment {
        IMAGE_NAME = "eshwarvenkat/calculator-app"
        CONTAINER_NAME = "calculator-app"
    }

    triggers {
        githubPush()   // Trigger automatically on GitHub commits
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Eshwar-venkat/devops-git-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME:latest ."
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh """
                        docker ps -q --filter name=$CONTAINER_NAME | grep -q . && docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME || true
                        docker run -d --name $CONTAINER_NAME -p 8081:5000 $IMAGE_NAME:latest
                    """
                }
            }
        }
    }

    post {
        success {
            emailext (
                subject: "Pipeline SUCCESS: Calculator App",
                body: """Hello Team,<br><br>
                        Jenkins pipeline completed successfully.<br>
                        The Calculator App is available at: http://http://13.203.103.240:8081<br><br>
                        Regards,<br>Jenkins""",
                to: "riovenkatrio@gmail.com"
            )
        }
        failure {
            emailext (
                subject: "Pipeline FAILED: Calculator App",
                body: "Pipeline failed. Please check Jenkins logs.",
                to: "riovenkatrio@gmail.com"
            )
        }
    }
}
