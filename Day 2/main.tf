provider "aws" {
    region = var.region
}

resource "aws_instance" "my-instance" {
    ami = var.image_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.my-sg.id]
        tags = {
      "env"="dev"
    }

}

resource "aws_security_group" "my-sg" {
    region="us-east-2"
    description = "new sg"
    name="new-sg"
    tags = {
      "env"="dev"
    }
    vpc_id = "vpc-0a9802b16c47deb59"

    ingress{
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }

     egress{
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

}

variable "image_id" {
  default = "ami-0f5fcdfbd140e4ab7"
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "region" {
    default = "us-east-2"
  
}

output "public_ip"{
    value = aws_instance.my-instance.public_ip
}