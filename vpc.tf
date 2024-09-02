# VPC Creation
resource "aws_vpc" "mohsin-vpc-1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "mohsin-vpc-1"
  }
}

# Public Subnet creation 
resource "aws_subnet" "public-eu-north-1a" {
  vpc_id                  = aws_vpc.mohsin-vpc-1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-north-1a"
  }
}

resource "aws_subnet" "public-eu-north-1b" {
  vpc_id                  = aws_vpc.mohsin-vpc-1.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-eu-north-1b"
  }
}

# Private Subnet creation 
resource "aws_subnet" "private-eu-north-1a" {
  vpc_id                  = aws_vpc.mohsin-vpc-1.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-eu-north-1a"
  }
}

resource "aws_subnet" "private-eu-north-1b" {
  vpc_id                  = aws_vpc.mohsin-vpc-1.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-eu-north-1a"
  }
}


# IGW creation for VPC
resource "aws_internet_gateway" "mohsin-igw" {
  vpc_id = aws_vpc.mohsin-vpc-1.id
  tags = {
    Name = "mohsin-igw"
  }
  depends_on = [aws_vpc.mohsin-vpc-1]
}

# Route table for Public Subnet
resource "aws_route_table" "mohsin-rt-public" {
  vpc_id = aws_vpc.mohsin-vpc-1.id
  tags = {
    Name = "mohsin-rt-public"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mohsin-igw.id
  }
}

# Route table for Private Subnet
resource "aws_route_table" "mohsin-rt-private" {
  vpc_id = aws_vpc.mohsin-vpc-1.id
  tags = {
    Name = "mohsin-rt-private"
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

# Route Table association for Public Subnet
resource "aws_route_table_association" "subnet_association-pub1a" {
  subnet_id      = aws_subnet.public-eu-north-1a.id
  route_table_id = aws_route_table.mohsin-rt-public.id
}

resource "aws_route_table_association" "subnet_association-pub1b" {
  subnet_id      = aws_subnet.public-eu-north-1b.id
  route_table_id = aws_route_table.mohsin-rt-public.id
}

# Route Table association for Private Subnets
resource "aws_route_table_association" "subnet_association-pr1a" {
  subnet_id      = aws_subnet.private-eu-north-1a.id
  route_table_id = aws_route_table.mohsin-rt-private.id
}

resource "aws_route_table_association" "subnet_association-pr1b" {
  subnet_id      = aws_subnet.private-eu-north-1b.id
  route_table_id = aws_route_table.mohsin-rt-private.id
}