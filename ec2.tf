resource "aws_instance" "mohsin-test" {
  ami           = "ami-090abff6ae1141d7d"  # Example AMI ID (Amazon Linux 2)
  instance_type = "t3.micro"               

  tags = {
    Name = "mohsin-test-ec2"
  }
}