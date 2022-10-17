# Private

# Create security group for VPC that allows ssh, http, https and tfe dashboard port 8800 for requests/replys inbound traffic 
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "Allow traffic needed for ssh and icmp echo request/reply"
  vpc_id      = aws_vpc.tfe-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 8800
    to_port     = 8800
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TFE-chavo"
  }
}
# Create security group for VPC that PostgreSQL traffic 
resource "aws_security_group" "tfe-db-sg" {
  name        = "tfe-db-sg"
  description = "Allow traffic needed for ssh and icmp echo request/reply"
  vpc_id      = aws_vpc.tfe-vpc.id

  // PostgreSQL port
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.31.32.0/24"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.31.32.0/24"]
  }
  tags = {
    Name = "TFE-chavo"
  }
}