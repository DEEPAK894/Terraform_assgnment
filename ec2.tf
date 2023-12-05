# ec2.tf

provider "aws" {
  region = "us-east-2" # Update with your desired region
  //profile = "default"
  access_key = "AKIATK6MJJCYYMADR2GU"
   secret_key = "TEU3YJUSm3eTCexT5+eR072oIm19nLQazxlgW5dA"
}
resource "aws_instance" "public_instance" {
  ami                    = "ami-06d4b7182ac3480fa" # Replace with your AMI ID
  instance_type          = "t2.micro"     # Adjust instance type as needed
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.ec2_key_pair.key_name
  associate_public_ip_address = true

  # Additional configurations can be added here
  tags = {
    Name = "PublicInstance"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nginx",  # Correct package name
      "sudo service nginx start",
      "sudo echo '${tls_private_key.ssh_key.private_key_pem}' > /home/ec2-user/private_key.pem",
      "sudo chmod 400 /home/ec2-user/private_key.pem"  # Start NGINX service
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = tls_private_key.ssh_key.private_key_pem
      host = self.public_ip
    }
  }
}

resource "aws_instance" "private_instance" {
  ami                    = "ami-06d4b7182ac3480fa" # Replace with your AMI ID
  instance_type          = "t2.micro"     # Adjust instance type as needed
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.ec2_key_pair.key_name

  # Additional configurations for private instance
  tags = {
    Name = "PrivateInstance"
  }
  user_data =  file("user.sh")
}
