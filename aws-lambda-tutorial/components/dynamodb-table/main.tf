module "dynamodb_table" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.name
  hash_key = var.hash_key

  attributes = [
    {
      name = "ID"
      type = "N"
    },
  ]
}
