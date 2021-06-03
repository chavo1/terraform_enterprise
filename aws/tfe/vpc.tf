####Create TFE VPC for the project
resource "aws_vpc" "tfe-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "chavo-tfe-vpc"
  }
}
# Create elastic ip to set static ip for the network load balancer
resource "aws_eip" "tfe-eip" {
  vpc = true
  tags = {
    Name = "chavo-tfe-eip"
  }
}