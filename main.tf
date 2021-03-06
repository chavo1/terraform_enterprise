provider "google" {
  credentials = file("./google_credentials.json")
  project     = "chavo-lab"
  zone        = var.zone
  region      = var.region
}
module "vpc" {
  source = "./modules/vpc/"
  tsl    = module.tfe.tfe-self-link
  db-ip  = module.db.ip-db
  region = var.region
  zone   = var.zone
}
module "tfe" {
  source = "./modules/tfe/"
  sn-id  = module.vpc.sn-id
  image  = var.image
}
output "network-balancer-output" {
  value = module.vpc.network-balancer-output
}
module "db" {
  source                           = "./modules/db/"
  vpc-id                           = module.vpc.vpc-id
  service-networking-connection-id = module.vpc.service-networking-connection-id
  region                           = var.region
  db_password                         = var.db_password
}
module "storage" {
  source = "./modules/storage/"
}


