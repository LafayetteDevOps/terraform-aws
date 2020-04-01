// IaC Providers.tf

provider "aws" {
  region = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
}
