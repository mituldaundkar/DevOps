#LoadBalancer with AutoScaling

provider "aws" {
    region="ap-south-1"
  
}

resource "aws_launch_template" "launch_template_home" {
    name= "launch-temp-home"
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = var.vpc_security_group_ids
    user_data = <<EOF
        #!/bin/bash
        apt update -y
        apt install apache2 -y
        systemctl start apache2
        echo "<h1>Hello World" > /var/www/html/index.html
    EOF

    tags= {
        env=var.env
    }

}

resource "aws_launch_template" "launch_template_cloth" {
    name= "launch-temp-cloth"
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = var.vpc_security_group_ids
    user_data = <<EOF
        #!/bin/bash
        apt update -y
        apt install apache2 -y
        systemctl start apache2
        echo "<h1>This is cloth section" > /var/www/html/cloth/index.html
    EOF

    tags= {
        env=var.env
    }

}



resource "aws_launch_template" "launch_template_laptop" {
    name= "launch-temp-laptop"
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    vpc_security_group_ids = var.vpc_security_group_ids
    user_data = <<EOF
        #!/bin/bash
        apt update -y
        apt install apache2 -y
        systemctl start apache2
        echo "<h1>This is LAPTOP section" > /var/www/html/laptop/index.html
    EOF

    tags= {
        env=var.env
    }

}

#AutoScaling Group

resource "aws_autoscaling_group" "asg_home" {
  name= "asg-home"
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.desired_size
  availability_zones = var.availability_zones
  tags= {
    env= var.env
  }
  launch_template {
    id= aws_launch_template.launch_template_home.id
  }

}

#AutoScaling Group Policy

resource "aws_autoscaling_policy" "asp_home" {
  name= "asp-home"
  autoscaling_group_name = aws_autoscaling_group.asg_home.name
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration{
    predefined_metric_specification {
      predefined_metric_type= "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}

resource "aws_autoscaling_group" "asg_cloth" {
  name= "asg-cloth"
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.desired_size
  availability_zones = var.availability_zones
  tags= {
    env= var.env
  }
  launch_template {
    id= aws_launch_template.launch_template_cloth.id
  }

}

#AutoScaling Group Policy

resource "aws_autoscaling_policy" "asp_cloth" {
  name= "asp-cloth"
  autoscaling_group_name = aws_autoscaling_group.asg_cloth.name
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration{
    predefined_metric_specification {
      predefined_metric_type= "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}

resource "aws_autoscaling_group" "asg_laptop" {
  name= "asg-laptop"
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.desired_size
  availability_zones = var.availability_zones
  tags= {
    env= var.env
  }
  launch_template {
    id= aws_launch_template.launch_template_laptop.id
  }

}

#AutoScaling Group Policy

resource "aws_autoscaling_policy" "asp_laptop" {
  name= "asp-laptop"
  autoscaling_group_name = aws_autoscaling_group.asg_laptop.name
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration{
    predefined_metric_specification {
      predefined_metric_type= "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}