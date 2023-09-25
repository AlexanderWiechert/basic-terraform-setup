variable "profile" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "account_id" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    managed_by       = "Terraform"
    terraform_source = "https://github.com/AlexanderWiechert/basic_terraform_setup"
    Environment      = "default"
    Landscape        = "ELASTIC2LS"
    ITServiceName    = "COMMON"
    Name             = "development"
  }
}