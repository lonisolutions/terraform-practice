
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
}
/*
resource "github_repository" "terraform-practice" {
    name        = "terraform-practices"
    description = "terraform practice repository"
    visibility = "public"
}
*/