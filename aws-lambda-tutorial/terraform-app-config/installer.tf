resource "nuon_app_installer" "my_aws_lambda_app" {
  app_id            = nuon_app.my_aws_lambda_app.id
  name              = "My AWS Lambda App"
  description       = "A demo app that runs on AWS Lambda."
  slug              = nuon_app.my_aws_lambda_app.name
  documentation_url = "https://docs.nuon.co/"
  community_url     = "https://join.slack.com/t/nuoncommunity/shared_invite/zt-1q323vw9z-C8ztRP~HfWjZx6AXi50VRA"
  logo_url          = "https://assets-global.website-files.com/62a2c1332b518a9eedc6de2f/651df2030c43865b9b16046b_Group%2048.png"
  github_url        = "https://github.com/nuonco"
  homepage_url      = "https://www.nuon.co/"
  demo_url          = "https://www.nuon.co/"
}
