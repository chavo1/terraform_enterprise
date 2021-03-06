resource "google_storage_bucket" "tfe-storage" {
  name                        = "tfe-chavo-storage"
  location                    = "EUROPE-WEST2"
  force_destroy               = true
  uniform_bucket_level_access = true
}
