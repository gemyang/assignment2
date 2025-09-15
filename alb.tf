resource "aws_lb" "alb-tf" {
  name = "alb-tf"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg_tf.id]
  subnets  = [data.aws_subnet.public-1a.id, data.aws_subnet.public-1b.id]
}

resource "aws_lb_target_group" "port80-tg-tf" {
  name = "port80-tg-tf"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.main.id
}

resource "aws_lb_target_group" "port9090-tg-tf" {
  name = "port9090-tg-tf"
  port = 9090
  protocol = "HTTP"
  vpc_id = data.aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "lb_attach_80-tf" {
    target_group_arn = aws_lb_target_group.port80-tg-tf.arn
    target_id = aws_instance.webserver-tf.id
    port = 80
}

resource "aws_lb_target_group_attachment" "lb_attach_9090-tf" {
    target_group_arn = aws_lb_target_group.port9090-tg-tf.arn
    target_id = aws_instance.webserver-tf.id
    port = 9090
}


resource "aws_lb_listener" "listen80-tf" {
  load_balancer_arn = aws_lb.alb-tf.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.port80-tg-tf.arn
  }
}

resource "aws_lb_listener" "listen9090-tf" {
  load_balancer_arn = aws_lb.alb-tf.arn
  port = "9090"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.port9090-tg-tf.arn
  }
}