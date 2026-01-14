#Modules

provider "aws" {
  region = "us-east-2"
}

module "instance" {
  source = "./modules/ec2"

  #Passing variable from outside
  ami ="ami-0f5fcdfbd140e4ab7"
}