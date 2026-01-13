variable "image_id" {
    default = "ami-02b8269d5e85954ef"
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "vpc_security_group_ids" {
    default = ["sg-06217b1af8aa74feb"]
  
}

variable "key_pair" {
    default = "mitul-ap"
  
}

variable "env" {
    default = "dev"
  
}

variable "min_size" {
  default = "2"
}

variable "max_size" {
  default = "5"
}

variable "desired_size" {
  default= "3"
}

variable "availability_zones" {
  default = ["ap-south-1a","ap-south-1c", "ap-south-1b"]
}

variable "vpc_id" {
  default= "vpc-06b4cf341640b4037"
}

variable "subnets" {
    default = ["subnet-09c853619cbd4bed0", "subnet-0289179964edd01ae", "subnet-05e3e8e16e8e53a26"]
  
}