# TERRAFORM BLOCK
terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.51.0"
    }
  }
}

# RESOURCE BLOCK "RESOURCE_TYPE" "RESOURCE_NAME"
resource "google_bigquery_table_iam_member" "member" {
  project = google_bigquery_table.test.project
  dataset_id = google_bigquery_table.test.dataset_id
  table_id = google_bigquery_table.test.table_id
  role = "roles/bigquery.dataOwner"
  member = "user:jane@example.com"
}