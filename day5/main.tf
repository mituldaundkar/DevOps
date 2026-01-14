#Terraform backend S3 

terraform {
  backend "s3" {
    bucket = "mitul-14jan"
    region= "us-east-1"
    key= "terraform.tfstate"
    
  }
}

provider "aws" {
    region = "us-east-2"
  
}

resource "aws_instance" "my_instance" {
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-09d7fb379beed7971"]
  
}