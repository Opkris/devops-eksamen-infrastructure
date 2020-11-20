terraform {
  backend "gcs" {
    bucket = "devops-eksamen-bucket-v2"
    prefix = "terraformstate"
    credentials = "GCP-key.json"
  }
}

provider "google-beta" {
  credentials = "GCP-key.json"
  project = var.project_id
  region      = "eu-north-1"
}