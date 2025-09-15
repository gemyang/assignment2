resource "aws_dynamodb_table" "db_table" {
  name = "simple-web-app"
  read_capacity = 20
  write_capacity = 20
  hash_key = "Comment"
  range_key = "Timestamp"

  attribute {
    name = "Comment"
    type = "S"
  }

  attribute {
    name = "Timestamp"
    type = "S"
  }
}