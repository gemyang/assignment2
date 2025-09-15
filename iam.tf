resource "aws_iam_role" "ec2webserver-role-tf" {
  name = "ec2webserver-role-tf"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
  ] })
  tags = {
    created-by="terraform"
  }
}

resource "aws_iam_role_policy_attachment" "dynamo_attachement_tf" {
  role = aws_iam_role.ec2webserver-role-tf.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_role_policy_attachment" "ssm_attachement_tf" {
  role = aws_iam_role.ec2webserver-role-tf.name
  policy_arn = "arn:aws-us-gov:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2webserver-profile-tf" {
  name = "ec2webserver-profile-tf"
  role = aws_iam_role.ec2webserver-role-tf.name
}
