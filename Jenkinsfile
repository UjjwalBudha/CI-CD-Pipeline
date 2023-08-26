pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('access_key')
        AWS_SECRET_ACCESS_KEY = credentials('secret_key')
    }
    
        stage("Provisioning the kubernetes server") {
            steps {
                sh 'terraform init'
                sh 'terraform validate'
                sh "aws configure set aws_access_key_id ${access_key}"
                sh "aws configure set aws_secret_access_key ${secret_key}"
                sh 'terraform apply -auto-approve'
                sh 'ls'
                // sh 'curl http://checkip.amazonaws.com > publicip.txt' 
            }
        }
       
    }
}
