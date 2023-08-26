resource "aws_instance" "kops" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "test-worker"
  vpc_security_group_ids = [aws_security_group.kops-SG.id]
  subnet_id              = aws_subnet.Public_subnet.id
  tags = {
    Name = "Kubernetes"
  }

  # 	user_data = <<-EOF
  #         #!/bin/bash
  #         sudo apt-get update -y

  #         curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  #         echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  #         sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
  #         sudo apt-get update
  #         sudo apt-get install docker-ce docker-ce-cli containerd.io -y

  #         # Start and enable Docker service
  #         sudo service docker start
  #         sudo systemctl enable docker

  #         # Add the current user to the docker group
  #         sudo usermod -aG docker $USER

  #         # Download and install Minikube and kubectl
  #         wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  #         sudo cp minikube-linux-amd64 /usr/local/bin/minikube
  #         sudo chmod +x /usr/local/bin/minikube

  #         curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  #         chmod +x kubectl
  #         sudo mv kubectl /usr/local/bin/

  #         # Start Minikube
  #         minikube start --driver=docker
  #     EOF


}