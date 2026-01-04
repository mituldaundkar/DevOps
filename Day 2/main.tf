provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "my-instance" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-09d7fb379beed7971"]
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
        cidr_blocks = "0.0.0.0/0"
    }

     egress{
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = "0.0.0.0/0"
    }

}