data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ec2_key"
  public_key = tls_private_key.tlskey.public_key_openssh
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ssm_parameter.ami_id.value
  instance_type = "t3.micro"
  key_name      = aws_key_pair.generated_key.key_name
  
  tags = {
    Name = "WayneCorp"
  }
}