resource "google_compute_firewall" "poolui_firewall" {
  name          = "${var.name["poolui"]}-firewall"
  network       = "${var.network}"
  target_tags   = ["${var.name["poolui"]}"]
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = "${var.poolui_allowed_ports}"
  }
}
