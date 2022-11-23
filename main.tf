terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.40.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_codedeploy_app" "nodejs-express-app-2" {
  compute_platform = "Server"
  name             = "nodejs-express-app-2"
}

resource "aws_codedeploy_deployment_group" "example" {
  app_name              = aws_codedeploy_app.nodejs-express-app-2.name
  deployment_group_name = "nodejs-express-app-2-group"
  service_role_arn      = "arn:aws:iam::997817439961:role/smit-codedeploy-role"

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "nodejs-smit-deployment"
    }
  }
}