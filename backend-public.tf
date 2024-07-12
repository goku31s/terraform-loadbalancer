resource "google_compute_backend_service" "public_backend" {
  name                    = "public-backend"
  port_name               = "http"
  protocol                = "HTTP"
  timeout_sec             = 30
  health_checks           = [google_compute_health_check.http_health_check.self_link]

  backend {
    group = google_compute_instance_group.public_group.self_link
  }
}