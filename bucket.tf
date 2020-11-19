resource "google_storage_bucket" "static-site" {
  project = var.project_id
  name = var.bucket_id
  location = "EU"
}