variable "GCP_PROJECT_ID" {
    type = string
    description = "GCP project identifier"
}

variable "GCP_PROJECT_REGION" {
    type = string
    description = "GCP project region"
}

variable "GCP_PROJECT_ZONE" {
    type = string
    description = "GCP project zone"
}

variable "GCP_CREDENTIAL_KEYS" {
    type = string
    description = "GCP service account credential keys"
}

variable "GCS_BUCKET_NAME" {
    type = string
    description = "Cloud Storage bucket name"
}

variable "GCS_BUCKET_STORAGE_CLASS" {
    type = string
    description = "Cloud Storage bucket storage class"
}

variable "BQ_BRONZE_DATASET_NAME" {
    type = string
    description = "BigQuery bronze dataset name"
}

variable "BQ_SILVER_DATASET_NAME" {
    type = string
    description = "BigQuery silver dataset name"
}

variable "BQ_GOLD_DATASET_NAME" {
    type = string
    description = "BigQuery gold dataset name"
}
