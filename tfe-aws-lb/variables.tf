# variables.tf

variable "vpc_net" {}
variable "aws_region" {}
variable "private01_cidr" {}
variable "private02_cidr" {}
variable "public_cidr" {}
variable "domain" {}
variable "tfe-ami" {}
###DB user name and credentials for database.tf
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
###SSH Public key in tfe-server.tf
variable "ssh-public-key" {}
###Route53 variables in route53.tf
variable "r53-zone-id" {}
variable "domain-name" {}
variable "db-domain-name" {}