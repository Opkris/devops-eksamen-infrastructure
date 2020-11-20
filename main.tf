resource "google_cloud_run_service" "default" {
  name     = "google_cloud_opkris_v1"
  location = "eu-north-1"

  template {
    spec {
      containers {
        image = "gcr.io/devops-eksamen-295808/devops-eksamen:2c07968ef370d71f5ffe60bb4cc1ffcd0d2e3444"
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