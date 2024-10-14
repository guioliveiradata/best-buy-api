resource "google_bigquery_dataset" "best_buy_bronze" {
  dataset_id = var.BQ_BRONZE_DATASET_NAME
  project = var.GCP_PROJECT_ID
  location = var.GCP_PROJECT_REGION
}

resource "google_bigquery_dataset" "best_buy_silver" {
  dataset_id = var.BQ_SILVER_DATASET_NAME
  project = var.GCP_PROJECT_ID
  location = var.GCP_PROJECT_REGION
}

resource "google_bigquery_dataset" "best_buy_gold" {
  dataset_id = var.BQ_GOLD_DATASET_NAME
  project = var.GCP_PROJECT_ID
  location = var.GCP_PROJECT_REGION
}
