resource "google_compute_network" "my_vpc" {
  name = "sukrit-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = "custom-subnet"
  region        = "europe-north1"  
  network       = google_compute_network.my_vpc.name
  ip_cidr_range = "10.0.0.0/24"   
}