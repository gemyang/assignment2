resource "aws_security_group" "alb_sg_tf" {
  name = "alb-sg-tf"
  description = "Allow traffic to alb"
  vpc_id = data.aws_vpc.main.id
  tags = {
    Name = "alb-sg-tf"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_allow_myip_80" {
  security_group_id = aws_security_group.alb_sg_tf.id
  ip_protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_ipv4 = var.my_ip
}

resource "aws_vpc_security_group_ingress_rule" "alb_allow_myip_9090" {
  security_group_id = aws_security_group.alb_sg_tf.id
  ip_protocol = "tcp"
  from_port = 9090
  to_port = 9090
  cidr_ipv4 = var.my_ip
}

resource "aws_vpc_security_group_egress_rule" "allow_all_alb" {
  security_group_id = aws_security_group.alb_sg_tf.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}