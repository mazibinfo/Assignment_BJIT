terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-state-bucket"                        # The name of your S3 bucket
    key            = "terraform/state/my-project/terraform.tfstate"     # The state file path within the bucket
    region         = var.aws_region                                      # AWS region where the bucket is located
    encrypt        = true                                               # Enable server-side encryption for the state file
    dynamodb_table = "terraform-lock"                                    # DynamoDB table name for state locking
  }
}