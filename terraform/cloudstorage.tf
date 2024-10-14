resource "google_storage_bucket" "datalake" {
  name = var.GCS_BUCKET_NAME
  project = var.GCP_PROJECT_ID
  location = var.GCP_PROJECT_REGION

  # Optionals
  storage_class = var.GCS_BUCKET_STORAGE_CLASS
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
  
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }

  force_destroy = true
}
