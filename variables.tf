variable "my_ip" {
  description = "the IP address of all FRS Workspaces; this should really be named my public ip cidr value"
  default = "3.83.200.219/32"
}
variable "ec2_ami" {
  description = "the AMI to use when launching an EC2"
  default = "ami-06cf22f69c918a2c1"
}