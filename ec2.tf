resource "aws_instance" "kops" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "test-worker"
  vpc_security_group_ids = [aws_security_group.kops-SG.id]
  subnet_id              = aws_subnet.Public_subnet.id
  tags = {
    Name = "Kubernetes"
  }

  user_data = <<-EOF
          #!/bin/bash
          sudo apt-get update -y
    
          
      EOF


}
