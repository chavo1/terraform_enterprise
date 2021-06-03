resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}
resource "google_compute_global_address" "private_ip_alloc" {
  name          = "private-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
  depends_on    = [google_compute_network.vpc_network]
}
resource "google_service_networking_connection" "foobar" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
  depends_on              = [google_compute_network.vpc_network]
}
output "vpc-id" {
  value = google_compute_network.vpc_network.id
}
output "service-networking-connection-id" {
  value = google_service_networking_connection.foobar.id
}