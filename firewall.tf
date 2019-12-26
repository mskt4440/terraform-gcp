resource "google_compute_firewall" "firewall_allow_web" {
  name    = "allow-web"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}
