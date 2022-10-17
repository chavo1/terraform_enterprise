# Playground [Terraform Enterprise](https://developer.hashicorp.com/terraform/enterprise) GCP/AWS Reference [Architecture](https://www.terraform.io/docs/enterprise/before-installing/reference-architecture/gcp.html)

## Terraform Enterprise on AWS with two subnets - Public and Private and network Load Balancer for inbound connection
- Private subnet have an outbound route to the Public network - nat_gateway.
- Public subnet have a route to the Internet Gateway
- Private network should have inbound connection trough the network Load Balancer

### Overview

<img src="tfe-aws-lb/screenshots/diagram_aws.png"/>

## Terraform Enterprise on GCP ...