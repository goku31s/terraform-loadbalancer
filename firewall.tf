resource "google_compute_firewall" "iap_firewall" {
  name    = "iap-firewall-rule33"
  network = google_compute_network.my_vpc.name
 
  allow {
    protocol = "tcp"
    ports    = ["22", "80"]  
  }
 

  source_ranges = ["35.235.240.0/20"] 

}

resource "google_compute_firewall" "allow_http_tf" {
  name = "allow-http-tf"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}