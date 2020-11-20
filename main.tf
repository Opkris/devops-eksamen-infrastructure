resource "google_cloud_run_service" "default" {
  name     = "google-cloud-42opkris42-v1"
  location = "us-central1"
  project = "devops-eksamen-295808"

  template {
    spec {
      containers {
        image = "gcr.io/devops-eksamen-295808/devops-eksamen:a31902d521370f56a29c3aea330c6b3c526c6c32"
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}