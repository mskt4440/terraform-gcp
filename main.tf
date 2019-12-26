# General
terraform {
  required_version = "0.12.17"
  required_providers {
    google = "= 3.1.0"
  }
  backend "gcs" {
    bucket = "mktfstate"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
