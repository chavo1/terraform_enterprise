resource "google_compute_subnetwork" "tfe-subnet" {
  name          = "tfe-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
output "sn-id" {
  value = google_compute_subnetwork.tfe-subnet.id
}