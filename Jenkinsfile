pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIAL = credentials('docker_cred')
    }
    // stages {
    //     stage("Build Nodejs Image") {
    //         steps {
    //             sh 'docker build -t nodejs .'
    //             sh 'docker images'
    //             sh 'docker ps'
    //             sh 'ls -ltr'
    //         }
    //     }
    //     stage("Delivery of Image to Docker Hub") {
    //         steps {
    //             sh 'docker login -u ${DOCKERHUB_CREDENTIAL_USR} -p ${DOCKERHUB_CREDENTIAL_PSW}'
    //             sh 'docker tag nodejs:latest ujjwalbudha000/myrepo:v9'
    //             sh 'docker push ujjwalbudha000/myrepo:v9'
    //         }
    //     }

        stage("Provisioniong the kubernetes server"){
            steps {
                sh 'terraform init'
                sh 'terraform validate'
                sh 'terraform apply -auto-approve'
                sh 'curl http://checkip.amazonaws.com > publicip.txt' 
            }
        }
        
        stage("Deployment to Minikube") {
            steps {
                sh "echo 'working till here'"
            }
        }
    }
// }
