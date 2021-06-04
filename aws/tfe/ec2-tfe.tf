###Creating EC2 instancce for the tfe 
resource "aws_instance" "tfe" {
  ami = var.tfe-ami
  #  iam_instance_profile = "${aws_iam_instance_profile.test_ptfe.name}"
  instance_type               = "t2.xlarge"
  iam_instance_profile        = aws_iam_instance_profile.chavo-profile.name
  subnet_id                   = aws_subnet.tfe-vpc-tfe-subnet.id
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  depends_on = [
    aws_s3_bucket.tfe-bucket,
    aws_db_instance.tfe-db,
  ]
  user_data = <<EOF
#!/usr/bin/env bash
pushd  /home/ubuntu/assets/replicated/
private_ip=$(curl -sSf 'http://169.254.169.254/latest/meta-data/local-ipv4')
[ -z "$private_ip" ] && exit 1
public_ip=$(curl -sSf 'http://169.254.169.254/latest/meta-data/public-ipv4')
[ -z "$public_ip" ] && public_ip=$${private_ip}
./install.sh airgap no-proxy private-address=$${private_ip} public-address=$${public_ip}
EOF
  key_name  = aws_key_pair.chavo-tfe.id
  tags = {
    Name = "chavo-tfe"
  }
  availability_zone = "us-east-1a"
  root_block_device {
    volume_size = 60
  }

  timeouts {
    delete = "1m"
  }

}
###Create ssh public ssh key in tfe-server.tf
resource "aws_key_pair" "chavo-tfe" {
  key_name   = "chavo-tfe"
  public_key = var.ssh-public-key
}