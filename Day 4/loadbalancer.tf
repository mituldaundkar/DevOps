#Target Groups

resource "aws_lb_target_group" "tg_home" {
    name= "tg-home"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    tags = {
      env=var.env
    }
    health_check {
      path = "/home"
    }
}

resource "aws_lb_target_group" "tg_cloth" {
    name= "tg-cloth"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    tags = {
      env=var.env
    }
    health_check {
      path = "/cloth"
    }
}

resource "aws_lb_target_group" "tg_laptop" {
    name= "tg-laptop"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
    tags = {
      env=var.env
    }
    health_check {
      path= "/laptop"
    }
}

#LoadBalancer

resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.subnets

  tags = {
    env = var.env
  }
}

#AWS security groups

resource "aws_security_group" "alb_sg" {
    name= "alb-sg"
    ingress {
        protocol = "TCP"
        to_port = 80
        from_port = 80
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        protocol = "TCP"
        to_port = 22
        from_port = 22
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress{
        protocol = "-1"
        to_port = 0
        from_port = 0
        cidr_blocks = [ "0.0.0.0/0" ]

    }
  description = "enable 80 and 22 port"
}