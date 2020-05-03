output "ip_address" {
  value = aws_eip.ip[*].public_ip

}