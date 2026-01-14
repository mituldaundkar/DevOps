provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "my-instance" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-09d7fb379beed7971"]
}