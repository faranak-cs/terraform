// DATASET
resource "google_bigquery_dataset" "default" {
  dataset_id                  = "faran_rag_test2"
  description                 = "Dataset for RAG pj"
  location                    = "US"
}

// TABLE
resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "help-techdesk-channel-v3"

  external_data_configuration {
    autodetect    = true
    source_format = "NEWLINE_DELIMITED_JSON"
    
    source_uris = [
      "gs://BUCKET_NAME/SUB_FOLDER_NAME/FILE_NAME.json",
    ]
  }

}

// SERVICE ACCOUNT
resource "google_service_account" "sa-name" {
  account_id = "faran-test-sa"
  display_name = "Faran test service account"
}

// PERMISSION TO RUN JOB AT DATASET LEVEL
resource "google_bigquery_dataset_iam_member" "member" {
  project = google_bigquery_table.default.project
  dataset_id = google_bigquery_table.default.dataset_id
  role = "roles/bigquery.user"
  member = "serviceAccount:${google_service_account.sa-name.email}"
}

// PERMISSION TO VIEW TABLE
resource "google_bigquery_table_iam_member" "member2" {
  project = google_bigquery_table.default.project
  dataset_id = google_bigquery_table.default.dataset_id
  table_id = google_bigquery_table.default.table_id
  role = "roles/bigquery.dataViewer"
  member = "serviceAccount:${google_service_account.sa-name.email}"
}

// KEY GENERATION
resource "google_service_account_key" "mykey" {
	service_account_id = google_service_account.sa-name.name
	public_key_type = "TYPE_X509_PEM_FILE"
}

// SAVE PRIVATE KEY
resource "local_file" "private_key_file" {
  content  = google_service_account_key.mykey.private_key
  filename = "${path.module}/private-key.json"
}

// OUTPUT A MSG
output "private_key_instructions" {
  value = "The private key has been saved to private-key.json. Handle it securely."
}
