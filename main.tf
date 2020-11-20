resource "google_cloud_run_service" "default" {
  name     = "google-cloud-42opkris42-v1"
  location = "eu-north-1"

  template {
    spec {
      containers {
        image = "gcr.io/devops-eksamen-295808/devops-eksamen:581e893458c6d0e6bd458972406b7f8119207a3b"
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