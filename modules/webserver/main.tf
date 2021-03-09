resource "aws_security_group" "ecomp-sg" {
    name = "ecomp-sg"
    vpc_id = var.vpc_id

    ingress {
      cidr_blocks = [var.my_ip]
      description = "SSH Port"
      from_port = 22
      to_port = 22
      protocol = "tcp"
    }
    ingress {
      cidr_blocks = [var.my_ip]
      description = "HTTP Port"
      from_port = 80
      to_port = 80
      protocol = "tcp"
    }

    egress {
      cidr_blocks = ["0.0.0.0/0"]
      description = "value"
      from_port = 0
      to_port = 0
      protocol = "-1"
      prefix_list_ids = []
    }

    tags = {
      Name: "${var.env_prefix}-ecomp-sg"
    }
}

data "aws_ami" "latest-amazon-linux-image" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = [var.image_name]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_key_pair" "ssh-key" {
    key_name = "server-key"
    public_key = file(var.public_key_location)
}

resource "aws_instance" "ecomp-server" {
    ami = data.aws_ami.latest-amazon-linux-image.image_id
    instance_type = var.instance_type
    
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ecomp-sg.id]
    availability_zone = var.avail_zone

    associate_public_ip_address = true
    key_name = aws_key_pair.ssh-key.key_name

    user_data = file("entry-script.sh")

    tags = {
      Name: "${var.env_prefix}-server"
    }
}
