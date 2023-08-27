pipeline {
    agent any
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
        stage("setting up the k8s server") {
            steps {
                sh 'terraform init'
                sh 'terraform fmt'
                sh 'aws configure set aws_access_key_id 'access key' && aws configure set aws_secret_access_key 'secretkey' && aws configure set default.region 'us-east-1' && aws configure set output json
'
                
            }
        }
        stage("provisioning the k8s server") {
            steps {
                  sh 'terraform apply -auto-approve'                
            }
        }
    }
}
