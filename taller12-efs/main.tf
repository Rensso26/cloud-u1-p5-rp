provider "aws" {
  region = var.region #region donde se desplegaran los recursos
}

resource "aws_security_group" "mi-sg-terraform-efs-instancias" {
  name        = "mi-security-group-instancias-efs"
  description = "Security group para mi instancia de Terraform"
  vpc_id      = "vpc-0a049e01fc175aef0"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.mi-sg-efs.id]
  }
  #regla de salida para internet
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_security_group" "mi-sg-efs" {
  name        = "mi-security-group-efs"
  description = "Security group para mi efs de Terraform"
  vpc_id      = "vpc-0a049e01fc175aef0"

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.mi-sg-terraform-efs-instancias.id]
  }

}

resource "aws_instance" "mi_instancia_efs" {
  ami                    = var.ami_id
  instance_type          = var.tipo_instancioa #tipo de instancia
  key_name               = var.nombre_llave
  count                  = var.cantidad_instancias
  vpc_security_group_ids = [aws_security_group.mi-sg-terraform-efs-instancias.id]
  tags = {
    Name = "Mi Instancia EFS - ${count.index + 1}"
  }

}
