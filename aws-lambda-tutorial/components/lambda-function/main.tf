module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name  = var.function_name
  image_uri      = var.image_uri
  package_type   = "Image"
  create_package = false

  attach_policy_json = true
  policy_json        = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "dynamodb:*"
            ],
            "Resource": ["*"]
      }
  ]
}
EOF
}
