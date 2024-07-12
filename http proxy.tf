resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-lb-proxy"
  url_map = google_compute_url_map.default.name
}

# Global Forwarding Rule
resource "google_compute_global_forwarding_rule" "default" {
  name        = "http-forwarding-rule"
  target      = google_compute_target_http_proxy.http_proxy.self_link
  port_range  = "80"
}