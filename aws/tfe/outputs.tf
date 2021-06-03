## Load balancer IP
output "elastip-ip" {
  value = aws_eip.tfe-eip.public_ip
}
