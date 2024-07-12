resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  region  = "europe-north1"

  network = google_compute_network.my_vpc.self_link
}

resource "google_compute_router_nat" "nat_config" {
  name    = "nat-config"
  router  = google_compute_router.nat_router.name
  region  = google_compute_router.nat_router.region

  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  

}