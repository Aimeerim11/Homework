resource "aws_vpc" "vpc2" {
  cidr_block = var.vpc_cidr
  tags = {
    Owner = "aimeerim"
  }
}

resource "aws_internet_gateway" "vpc2_igw" {
  vpc_id = aws_vpc.vpc2.id 
  tags = {
    Owner = "aimeerim"
  } 
  depends_on = [aws_vpc.vpc2] # depends_on tells Terraform to complete the aws_vpc.vpc1 creation first before creation aws_internet_gateway vpc1_igw 
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc2.id
  cidr_block              = var.cidr_block_public
  tags = {
    Owner   = "aimeerim"
  }
  depends_on = [aws_vpc.vpc2]
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = var.cidr_block_private
  tags = {
    Owner = "aika"
  }
  depends_on = [aws_vpc.vpc2]
}

resource "aws_default_route_table" "internet_gateway_rt" {
  default_route_table_id = aws_vpc.vpc2.main_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc2_igw.id
  }

  tags = {
    Owner = "aika"
  }

  depends_on = [aws_vpc.vpc2]
}

resource "aws_route_table_association" "internet_gateway_rt_association" {
  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_vpc.vpc2.main_route_table_id

  depends_on = [aws_subnet.public_subnet]
}