pipeline {
    agent any
    // environment {
   
    //     AWS_ACCESS_KEY_ID = credentials('access_key')
    //     AWS_SECRET_ACCESS_KEY = credentials('secret_key')
    // }
    stages {
        stage("Build Nodejs Image") {
            steps {
                
                sh 'docker build -t nodejs .'
                sh 'docker images'
                sh 'docker ps'
                sh 'ls -ltr'
            }
        }
        stage("Delivery of Image to Docker Hub") {
            steps {
               withCredentials([usernamePassword(
                    credentialsId: "docker_cred",
                    passwordVariable: "dockerhubPass",
                    usernameVariable: "dockerhubUser"
                    )]) {
                        sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                    }    
                sh 'docker tag nodejs:latest budhaujjwal/test:v9'
                sh 'docker push budhaujjwal/test:v9' 
               
            }
        }
        stage("Provisioning the kubernetes server") {
            steps {
                sh 'terraform init'
                sh 'terraform fmt'
                // sh "aws configure set aws_access_key_id ${access_key}"
                // sh "aws configure set aws_secret_access_key ${secret_key}"
                // sh 'curl http://checkip.amazonaws.com > publicip.txt' 
            }
        }
        stage("Deployment to Minikube") {
            steps {
                sh 'terraform apply -auto-apply'
            }
        }
    }
}
