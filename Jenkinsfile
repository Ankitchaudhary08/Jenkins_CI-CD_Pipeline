pipeline {
    agent any
    
    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/<your-username>/<your-repo>.git", branch: "main"
            }
        }
        stage("Build") {
            steps {
                echo "Building the image"
                sh "docker build -t my-todo-app ."
            }
        }
        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "docker tag my-todo-app ${env.dockerHubUser}/my-todo-app:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/my-todo-app:latest"
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh "docker-compose down || true"
                sh "docker-compose up -d"
            }
        }
    }
}
