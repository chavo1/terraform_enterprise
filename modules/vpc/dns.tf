resource "google_dns_record_set" "a" {
  name         = "tfe.chavo.eu."
  managed_zone = "chavo-tfe"
  type         = "A"
  ttl          = 60
  rrdatas      = [google_compute_address.static.address]
}
resource "google_dns_record_set" "db" {
  name         = "db.tfe.chavo.eu."
  managed_zone = "chavo-tfe"
  type         = "A"
  ttl          = 60
  rrdatas      = [var.db-ip]
}
