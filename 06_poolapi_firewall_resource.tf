resource "google_compute_firewall" "poolapi_firewall" {
  name          = "${var.name["poolapi"]}-firewall"
  network       = "${var.network}"
  target_tags   = ["${var.name["poolapi"]}"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = "${var.poolapi_allowed_ports}"
  }
}
