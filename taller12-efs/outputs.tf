output "ids_instancias" {
  description = "IDs de las instancias creadas"
  value       = aws_instance.mi_instancia_efs[*].id
}

output "cantidad_instancias" {
  description = "Cantidad de las instancias creadas"
  value       = length(aws_instance.mi_instancia_efs)
}

output "ips_public_instancias" {
  description = "IPs públicas de las instancias creadas"
  value       = aws_instance.mi_instancia_efs[*].public_ip
}

output "zonas_disponibilidad" {
  description = "Zonas de disponibilidad de las instancias creadas"
  value       = aws_instance.mi_instancia_efs[*].availability_zone
}