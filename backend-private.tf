resource "google_compute_backend_service" "private_backend" {
  name                    = "private-backend"
  port_name               = "http"
  protocol                = "HTTP"
  timeout_sec             = 30
  health_checks           = [google_compute_health_check.http_health_check.self_link]

  backend {
    group = google_compute_instance_group.private_group.self_link
  }
}