# Create VPC
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Create subnetwork
resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  network                  = google_compute_network.vpc.name
  region                   = var.region
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.podnet_name
    ip_cidr_range = var.podnet_cidr
  }

  secondary_ip_range {
    range_name    = var.servicenet_name
    ip_cidr_range = var.servicenet_cidr
  }

  log_config {
    aggregation_interval = var.flowlog_aggregation_interval
    flow_sampling        = var.flowlog_sampling
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# Create cloud router
resource "google_compute_router" "router" {
  name    = var.router_name
  region  = google_compute_subnetwork.subnet.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ALL"
  }
}