resource "google_cloud_run_service" "default" {
  name     = "google-cloud-42opkris42-v1"
  location = "us-central1"
  project = "devops-eksamen-295808"


  template {
    spec {
      containers {
        image = "gcr.io/devops-eksamen-295808/devops-eksamen:c64c53d6b2258af7fe55ff334895381c2ad1db77"
        resources {
          limits = {
            memory: 512
          }
        }
        env {
          name = "logz_token"
          value = var.logz_token
        }
        env {
          name = "logz_url"
          value = var.logz_url
        }
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