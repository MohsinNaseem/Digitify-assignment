resource "aws_s3_bucket" "mohsin_test_bucket" {
  bucket = "mohsin-test-bucket-12345"  

  tags = {
    Name        = "S3 Bucket"
    Environment = "Mohsin-Dev"
  }
}