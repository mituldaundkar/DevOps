provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "my-instance" {
    ami = "ami-0ecb62995f68bb549"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0615ec868a3605266"]
}