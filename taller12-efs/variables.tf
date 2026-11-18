#Region donde se desplegarán los recursos
variable "region" {
    description = "The Aws region"
    type = string
    default = "us-east-1"
}

variable "ami_id" {
    description = "Id de la AMI"
    type = string
    default = "ami-00f43ee0e98d52529"
  
}

variable "tipo_instancioa" {
    description = "Tipo de la instancia"
    type = string
    default = "t2.micro"
}

variable "nombre_llave" {
    description = "Nombre del par de llaves"
    type = string
    default = "mi-primera-llaves-rp"
}

variable "cantidad_instancias" {
    description = "Cantidad de instancias"
    type = number
    default = 2
}

