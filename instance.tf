data "aws_ami" "img_terraform" {
  owners = ["self"]
  filter {
    name   = "name"
    values = ["*terraform*"]
  }
}

resource "aws_instance" "Amazon_Linux_Ubuntu" {
  ami           = data.aws_ami.img_terraform.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name  = "Amazon_Linux_Ubuntu"
    Owner = "aimeerim"
  }
}

# resource "aws_instance" "Amazon_Linux_Ubuntu_private" {
#   ami           = data.aws_ami.img_terraform.id
#   instance_type = var.instance_type
#   subnet_id     = aws_subnet.private_subnet.id
#   associate_private_ip_address = true
#   tags = {
#     Name  = "Amazon_Linux_Ubuntu"
#     Owner = "aimeerim"
#   }
# }