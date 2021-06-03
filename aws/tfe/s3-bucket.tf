###Creating S3 bucket for the TFE
resource "aws_s3_bucket" "tfe-bucket" {
  bucket = "chavo-tfe-bucket"
  acl    = "private"
  tags = {
    Name = "chavo-tfe-bucket"
  }
  versioning {
    enabled = true
  }
}
###Setting up access policies 
resource "aws_s3_bucket_public_access_block" "tfe-bucket" {
  bucket                  = aws_s3_bucket.tfe-bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
