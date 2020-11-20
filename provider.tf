provider "google" {
  credentials = "GCP-key.json"
  project = var.project_id
  region      = "eu-north-1"
}