pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIAL = credentials('docker_cred')
        AWS_ACCESS_KEY_ID = credentials('access_key')
        AWS_SECRET_ACCESS_KEY = credentials('secret_key')
    }
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
                sh 'docker login'
                // sh 'docker login -u ${DOCKERHUB_CREDENTIAL_USR} -p ${DOCKERHUB_CREDENTIAL_PSW}'
                sh 'docker tag nodejs:latest ujjwalbudha000/myrepo:v9'
                sh 'docker push ujjwalbudha000/myrepo:v9'
            }
        }
        stage("Provisioning the kubernetes server") {
            steps {
                sh 'terraform init'
                sh 'terraform fmt'
                sh "aws configure set aws_access_key_id ${access_key}"
                sh "aws configure set aws_secret_access_key ${secret_key}"
                // sh 'curl http://checkip.amazonaws.com > publicip.txt' 
            }
        }
        stage("Terraform plan") {
            steps {
                sh 'terraform plan'
                sh 'echo "i am up till here"'
            }
        }
        stage("Deployment to Minikube") {
            steps {
                sh "echo 'working till here'"
            }
        }
    }
}
