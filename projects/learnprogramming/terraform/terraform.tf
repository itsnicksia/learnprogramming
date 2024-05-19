terraform {
  cloud {
    organization = "fasterthoughts"

    workspaces {
      name = "learnprogramming"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48.0"
    }
  }

  required_version = ">= 1.8.1"
}

provider aws {
  region = "eu-west-1"
  default_tags {
    tags = {
      project = local.project_name
      terraform-workspace = "learnprogramming"
    }
  }
}