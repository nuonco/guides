resource "nuon_app_input" "main" {
  app_id = nuon_app.my_byovpc_app.id

  input {
    name         = "vpc_id"
    description  = "The VPC to install the app in"
    sensitive    = false
    display_name = "VPC ID"
    required     = true
  }
}
