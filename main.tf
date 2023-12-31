terraform {
  backend "s3" {
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

module "s3" {
  source      = "./modules/s3"
  region      = var.region
  account_id  = var.account_id
  profile     = var.profile
  environment = var.environment
  project_name = var.project_name
  tags        = merge (
    var.tags
  )
}
