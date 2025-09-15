data "aws_vpc" "main" {
  default = true
}

data "aws_subnet" "public-1a" {
    availability_zone = "us-gov-west-1a"
}

data "aws_subnet" "public-1b" {
    availability_zone = "us-gov-west-1b"
}