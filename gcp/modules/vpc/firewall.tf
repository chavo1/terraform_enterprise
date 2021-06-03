resource "google_compute_firewall" "tfe" {
  name    = "tfe-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8800", "22"]
  }

  target_tags = ["firewall"]
}
