resource "aws_iam_role" "tfe_role" {
  name = "chavo-s3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_instance_profile" "chavo-profile" {
  name = "chavo-iam"
  role = aws_iam_role.tfe_role.name
}
resource "aws_iam_role_policy" "s3_policy" {
  name = "tfe-policy-s3"
  role = aws_iam_role.tfe_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.tfe-vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
}
resource "aws_vpc_endpoint_route_table_association" "tfe" {
  route_table_id  = aws_route_table.public.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}
