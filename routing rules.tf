resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.private_backend.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_service.private_backend.self_link

    path_rule {
      paths   = ["/public/*"]
      service = google_compute_backend_service.public_backend.self_link
    }

    path_rule {
      paths   = ["/internal/*"]
      service = google_compute_backend_service.private_backend.self_link
    }
  }
}