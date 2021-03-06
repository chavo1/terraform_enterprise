resource "google_compute_forwarding_rule" "http" {
  name       = "http-forwarding-rule"
  target     = google_compute_target_pool.default.id
  port_range = "80"
  ip_address = google_compute_address.static.address
}
resource "google_compute_forwarding_rule" "ssh" {
  name       = "ssh-forwarding-rule"
  target     = google_compute_target_pool.default.id
  port_range = "22"
  ip_address = google_compute_address.static.address
}
resource "google_compute_forwarding_rule" "https" {
  name       = "https-forwarding-rule"
  target     = google_compute_target_pool.default.id
  port_range = "443"
  ip_address = google_compute_address.static.address
}
resource "google_compute_forwarding_rule" "tfe" {
  name       = "tfe-forwarding-rule"
  target     = google_compute_target_pool.default.id
  port_range = "8800"
  ip_address = google_compute_address.static.address
}
resource "google_compute_target_pool" "default" {
  name = "tfe-target-pool"
  instances = [
    "europe-west2-a/tfe",
  ]
}
output "network-balancer-output" {
  value = google_compute_forwarding_rule.http.ip_address
}