variable "region" {
  description = "GCP region of the project"
  type        = string
}
variable "zone" {
  description = "GCP zone of the project"
  type        = string
}
variable "image" {
  description = "TFE image"
  type        = string
}
variable "db_password" {}
