resource "google_cloud_run_service" "default" {
  name = "google-cloud-42opkris42-v1"
  location = "us-central1"
  project = "devops-eksamen-295808"


  template {
    spec {
      containers {
        image = "gcr.io/devops-eksamen-295808/devops-eksamen:05096be3fbaa9dc0ac9c40aa88d1916d5194dee7"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
        env {
          name = "LOGZ_URL"
          value = var.logz_url
        }
        resources {
          limits = {
            memory: 512
          }
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
  location = google_cloud_run_service.default.location
  project = google_cloud_run_service.default.project
  service = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}