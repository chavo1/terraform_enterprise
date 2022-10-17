resource "aws_lb" "lb" {
  name = "lb"

  load_balancer_type               = "network"
  internal                         = false
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false

  subnet_mapping {
    subnet_id     = aws_subnet.public.id
    allocation_id = aws_eip.tfe-eip.id
  }
  tags = {
    Environment = "tfe_lb"
  }
  depends_on = [aws_internet_gateway.internet_gw]
}

resource "aws_lb_target_group" "http" {
  name     = "tfe-admin"
  port     = 8800
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
}

resource "aws_lb_target_group_attachment" "http" {
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.tfe.id
  port             = 8800
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "8800"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https.arn
  }
}

resource "aws_lb_target_group_attachment" "https" {
  target_group_arn = aws_lb_target_group.https.arn
  target_id        = aws_instance.tfe.id
  port             = 443
}

resource "aws_lb_target_group" "https" {
  name     = "tf-example-lb-tg-https"
  port     = 443
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
}

resource "aws_lb_listener" "ssh" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "22"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ssh.arn
  }
}

resource "aws_lb_target_group_attachment" "ssh" {
  target_group_arn = aws_lb_target_group.ssh.arn
  target_id        = aws_instance.tfe.id
  port             = 22
}

resource "aws_lb_target_group" "ssh" {
  name     = "tf-example-lb-tg-ssh"
  port     = 22
  protocol = "TCP"
  vpc_id   = aws_vpc.tfe-vpc.id
}

# Create elastic ip to set static ip for the network load balancer
resource "aws_eip" "tfe-eip" {
  vpc = true
  tags = {
    Name = "chavo-tfe-eip"
  }
}
