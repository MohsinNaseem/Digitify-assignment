resource "aws_s3_bucket" "mohsin_test_bucket" {
  bucket = "mohsin-test-bucket-123457"  

  tags = {
    Name        = "S3 Bucket"
    Environment = "Mohsin-Dev"
  }
}