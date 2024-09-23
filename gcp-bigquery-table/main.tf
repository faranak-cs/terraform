terraform {
  required_version = ">= 0.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.42.0"
    }
  }
   backend "gcs" {
    bucket  = "BUCKET-NAME"
    prefix  = "BUCKET-SUB-NAME"
  }
}

provider "google" {
  project     = "PROJECT-ID"
}
