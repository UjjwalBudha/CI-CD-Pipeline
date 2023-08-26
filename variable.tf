variable "ami" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "vpcs_id" {
  type    = string
  default = "aws_vpc.k8sVPC.id"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "security_group_id" {
  type    = string
  default = "aws_security_group.kops-SG.id"
}

variable "public_subnet_id" {
  type    = string
  default = "aws_subnet.Public_subnet.id"
}

