resource "google_compute_instance_group" "public_group" {
  name        = "public-instance-group"
  zone        = "europe-north1-b"
  instances   = [google_compute_instance.vm_create.self_link]
  named_port {
    name = "http"
    port = 80
  }
}