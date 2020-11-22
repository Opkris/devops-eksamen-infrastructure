provider "statuscake" {
  username = "opkris"
}

resource "statuscake_test" "google" {
  website_name = "devops"
  website_url  = google_cloud_run_service.default.status[0].url
  test_type    = "HTTP"
  check_rate   = 120
  contact_group = ["195550"]
}