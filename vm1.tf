resource "google_compute_instance" "vm_create" {
  name         = "sukritpublic-vm"
  machine_type = "e2-medium"
  zone         = "europe-north1-b"
 
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
 
  network_interface {
    network = google_compute_network.my_vpc.name
    subnetwork = google_compute_subnetwork.custom_subnet.name
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo 'Hello from Public Server' > /var/www/html/index.html
    systemctl restart apache2
    systemctl enable ssh   # Ensure SSH daemon starts on boot
    systemctl restart ssh  # Restart SSH daemon
  EOT
}





