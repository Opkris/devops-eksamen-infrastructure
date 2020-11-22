resource "google_storage_bucket" "static-site" {
  project = var.project_id
  name = "devops-eksamen-bucket-v2"
  location = "EU"
}