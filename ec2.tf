resource "aws_instance" "webserver-tf" {
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.ec2webserver-profile-tf.name
  ami  = var.ec2_ami
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.public-1a.id
  user_data = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.ec2_sg_tf.id]
}