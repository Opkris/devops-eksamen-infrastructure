provider "google" {
  credentials = "${file(" ... ")}"
  project = var.project_id
  region      = "eu-north-1"
}