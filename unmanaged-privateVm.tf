resource "google_compute_instance_group" "private_group" {
  name        = "private-instance-group"
  zone        = "europe-north1-b"
  instances   = [google_compute_instance.vm_private.self_link]
  named_port {
    name = "http"
    port = 80
  }
}