terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.6.0"
    }
  }
}

provider "google" {
  project = var.GCP_PROJECT_ID
  region  = var.GCP_PROJECT_REGION
  zone    = var.GCP_PROJECT_ZONE
  credentials = file("../${var.GCP_CREDENTIAL_KEYS}")
}
