output "vpc_id" {
  value = data.aws_vpc.main.id
}
output "subnet_ids" {
  value = [data.aws_subnet.public-1a.id, data.aws_subnet.public-1b.id]
}
output "load_balancer_dns" {
  value = aws_lb.alb-tf.dns_name
}
output "ec2_public_ip" {
  value = aws_instance.webserver-tf.public_ip
}
output "ec2_public_dns" {
  value = aws_instance.webserver-tf.public_dns
}
