resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.region

  network    = var.vpc_name
  subnetwork = var.subnet_name

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = var.podnet_name
    services_secondary_range_name = var.servicenet_name
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.authorized_cidr
      display_name = var.authorized_name
    }
  }

  cluster_autoscaling {
    enabled = false
  }
}

resource "google_container_node_pool" "cluster_nodespool" {
  name       = var.nodepool_name
  location   = var.region
  cluster    = google_container_cluster.cluster.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = var.nodepool_machine

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair = true
    auto_upgrade = true
  }
}
