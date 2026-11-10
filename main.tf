<<<<<<< HEAD
provider "aws" {
  region = "us-east-1" #region donde se desplegaran los recursos
}

#creamos el security group
resource "aws_security_group" "mi-sg" {
    name = "mi-security-group-terraform"
    description = "Sevurity group para mi instancia de Terraform"
    vpc_id = "vpc-0a049e01fc175aef0"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

#declaracion de los recursos de AWS
resource "aws_instance" "mi_instancia_3" {
    ami = "ami-0b5f645abc199e666"
    instance_type = "t3.medium" #tipo de instancia
    key_name = "mi-primera-llaves-rp"
    tags = {
      Name = "MiInstanciaTerraformWindows"
    }
    vpc_security_group_ids = [aws_security_group.mi-sg.id ]
=======
provider "aws" {
  region = "us-east-1" #region donde se desplegaran los recursos
}

#creamos el security group
resource "aws_security_group" "mi-sg" {
    name = "mi-security-group-terraform"
    description = "Sevurity group para mi instancia de Terraform"
    vpc_id = "vpc-0a049e01fc175aef0"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

#declaracion de los recursos de AWS
resource "aws_instance" "mi_instancia_2" {
    ami = "ami-0c230065b91270bc6"
    instance_type = "t2.micro" #tipo de instancia
    key_name = "mi-primera-llaves-rp"
    tags = {
      Name = "MiInstanciaTerraform2"
    }
    vpc_security_group_ids = [aws_security_group.mi-sg.id ]
>>>>>>> b3ce2e5a43f880ca3c34936547c688d631a59070
}