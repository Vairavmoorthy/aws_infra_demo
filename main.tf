provider "aws" {
    region = var.aws_region  
}
resource "aws_vpc" "awsvpc" {
    cidr_block = var.vpc_cidr_block
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.awsvpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.subnet_availability_zone
  
}
resource "aws_internet_gateway" "aig" {
    vpc_id = aws_vpc.awsvpc.id

}
resource "aws_route_table" "public_RT" {
   vpc_id = aws_vpc.awsvpc.id
   
   route  {
    cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.aig.id
    
   }
}
resource "aws_route_table_association" "aws_rts" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public_RT.id
  
}
  resource "aws_security_group" "public_sec" {
    name_prefix = var.security_group_name 
    vpc_id = aws_vpc.awsvpc.id
  

  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
    }
}
  
resource "aws_instance" "ubuntu-20" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("docker.sh")
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public_sec.id]
  associate_public_ip_address = true

  tags = {
    Name = "jt-pc"
  }

}
