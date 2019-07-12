resource "google_compute_firewall" "poolapi_mongodb_firewall" {
  name          = "${var.name["poolapi_mongodb"]}-firewall"
  network       = "${var.network}"
  target_tags   = ["${var.name["poolapi_mongodb"]}"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = "${var.poolapi_mongodb_allowed_ports}"
  }
}
