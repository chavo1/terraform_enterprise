resource "google_sql_database_instance" "postgres" {
  database_version = "POSTGRES_11"
  region           = var.region
  deletion_protection  = "false"
  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL"

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc-id
    }
    
  }
  depends_on = [var.service-networking-connection-id]
}
resource "google_sql_database" "database" {
  name     = "tfe-database"
  instance = google_sql_database_instance.postgres.name
}
resource "google_sql_user" "users" {
  name     = "db-user"
  instance = google_sql_database_instance.postgres.name
  password = var.db_password
}
resource "google_sql_ssl_cert" "client_cert" {
  common_name = "client-name"
  instance    = google_sql_database_instance.postgres.name
}
output "ip-db" {
  value = google_sql_database_instance.postgres.private_ip_address
}