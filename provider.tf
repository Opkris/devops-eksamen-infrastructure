terraform {
  backend "gcs" {
    bucket = "devops-eksamen-bucket-v3"
    prefix = "terraformstate"
    credentials = "GCP-key.json"
  }
}

provider "google-beta" {
  credentials = "GCP-key.json"
  project = var.project_id
  version = "~> 3.0.0-beta.1"
  region = "eu-north-1"
}