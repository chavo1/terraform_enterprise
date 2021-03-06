# Security group and rules
resource "google_compute_instance_group" "tfe-instance_group" {
  name        = "tfe-instance-group"
  description = "Terraform test instance group"

  instances = [
    var.tsl
  ]
  named_port {
    name = "http"
    port = "80"
  }
  named_port {
    name = "https"
    port = "443"
  }
  named_port {
    name = "ssh"
    port = "22"
  }
  named_port {
    name = "tfe"
    port = "8800"
  }
  zone = var.zone
}
