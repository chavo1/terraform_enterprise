resource "google_compute_instance" "tfe" {
  name                      = "tfe"
  machine_type              = "n1-standard-4"
  allow_stopping_for_update = true

  metadata = {
    ssh-keys = "chavo:${file("id_rsa.pub")}"
  }
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  tags = ["firewall"]
  network_interface {
    network    = "vpc-network"
    subnetwork = "tfe-subnet"
    network_ip = "10.2.0.10"
  }
  depends_on = [var.sn-id]
}
output "tfe-self-link" {
  value = google_compute_instance.tfe.self_link
}
