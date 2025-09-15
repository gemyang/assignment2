resource "aws_security_group" "ec2_sg_tf" {
  name        = "ec2-sg-tf"
  description = "Allow traffic to ec2"
  vpc_id      = data.aws_vpc.main.id
  tags = {
    Name = "ec2-sg-tf"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_allow_myip_80" {
  security_group_id = aws_security_group.ec2_sg_tf.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = var.my_ip
}

resource "aws_vpc_security_group_ingress_rule" "ec2_allow_myip_9090" {
  security_group_id = aws_security_group.ec2_sg_tf.id
  ip_protocol       = "tcp"
  from_port         = 9090
  to_port           = 9090
  cidr_ipv4         = var.my_ip
}

resource "aws_vpc_security_group_ingress_rule" "ec2_allow_alb_80" {
  security_group_id            = aws_security_group.ec2_sg_tf.id
  ip_protocol                  = "tcp"
  from_port                    = 80
  to_port                      = 80
  referenced_security_group_id = aws_security_group.alb_sg_tf.id

}
resource "aws_vpc_security_group_ingress_rule" "ec2_allow_alb_9090" {
  security_group_id            = aws_security_group.ec2_sg_tf.id
  ip_protocol                  = "tcp"
  from_port                    = 9090
  to_port                      = 9090
  referenced_security_group_id = aws_security_group.alb_sg_tf.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_ec2" {
  security_group_id = aws_security_group.ec2_sg_tf.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
