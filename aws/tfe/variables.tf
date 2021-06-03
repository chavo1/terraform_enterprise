###AWS Credentials for aws-credentials.tf
variable "tfe-ami" {
  type    = string
  default = "ami-08d22856d67868426"
}
###DB user name and credentials for database.tf
variable "db_name" {
  type    = string
  default = "tfedb"
}
variable "db_username" {
  type    = string
  default = "chavo"
}
variable "db_password" {
  type    = string
  default = "Mimka_2000"
}
###SSH Public key in tfe-server.tf
variable "ssh-public-key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTwz3CxkK0MUimguarMZKBH7HGI/+CixKIMf2Z9LJFw424vzXlZ/bAWUCx/6u3MKLCItlk3LTw/eueuALrbN/ZPSwEufEPJ86pCiGGlqM6Ch98HdXr035kB6/pdpkyJc9R2f24wmX5GH2T3rI2vvPMbwzaXFh50NnoDgh/TnAMgfqLe4j9fuz6XChKuKKz0gYsf3EA1qMGI0BAe/jzDMZ0ufhgso6z8EsbETcUZOeujrGTQbZC4wX9wahICEizHa91m4C03NAmP5X02KECJNxmcLTrg+Cc+0Um+6Hhdo4dhMvJuYl6b3nMaHyQDKOEnER8edEJwmId9PciPMSAxwTzfdxYo9/M5jlbw9iwRKrkUym3GWy1l82a3pwHMbwUDC2K/cVymM84jbfgH8HKaR2USTNv54NUi4DaY97+dT74gB4IJyggRIK2vUYA59ei97Y1h1HqqxZGYCG8AwNxZTIAg86W6WJsLupaR/ed2/vG1HoiGaS5Xn0IVimoGxcDTL6dF2slwN99yXlDoQ5GHHfCH1uv5D1OANIjEgePCID20KPFHOb32XoK00/i/OboomdP+amz8EqpDPq45HBC4ZyuBhpes03zp031H1qz9EaH0UGX9eLMKJSGJTDdxshiOVqA2I54/cYdPiySgAK5VcFuWSHlTj1J0d81xZuFV5j5Lw== chavdar.rakov@gmail.com"
}
###Route53 variables in route53.tf
variable "r53-zone-id" {
  type    = string
  default = "Z08543773I76Y3UF93CGA"
}
variable "domain-name" {
  type    = string
  default = "tfe.chavo.eu"
}
variable "db-domain-name" {
  type    = string
  default = "db.tfe.chavo.eu"
}