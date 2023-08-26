resource "aws_vpc" "k8sVPC" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Terraform_VPC"
  }
}

resource "aws_internet_gateway" "ig_gateway" {
  vpc_id = aws_vpc.k8sVPC.id

  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_subnet" "Public_subnet" {
  vpc_id                  = aws_vpc.k8sVPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_public"
  }
}
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.k8sVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_gateway.id    
  }
  tags = {
      Name = "tearraform_public_RT"
    }

}

resource "aws_route_table_association" "public-rout-table-association" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_subnet" "Private_subnet" {
  vpc_id                  = aws_vpc.k8sVPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "TerraformPrivatesubnet"
  }
}
