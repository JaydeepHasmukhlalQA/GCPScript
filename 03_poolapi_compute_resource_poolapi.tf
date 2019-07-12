resource "google_compute_instance" "poolapi_compute" {
  name         = "${var.name["poolapi"]}-${local.timestamp_sanitized}"
  machine_type = "${var.machine_type["standard2"]}"
  zone         = "${var.zone}"
  tags         = ["${var.name["poolapi"]}"]
  boot_disk {
    initialize_params {
      image = "${var.image["ubuntu_1804_lts"]}"
    }
  }
  network_interface {
    network = "${var.network}"
    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    sshKeys = "${var.ssh_user["poolapi"]}:${file("${var.public_key}")}"
  }
  connection {
    type        = "ssh"
    user        = "${var.ssh_user["poolapi"]}"
    host        = "${google_compute_instance.poolapi_compute.network_interface.0.access_config.0.nat_ip}"
    private_key = "${file("${var.private_key}")}"
  }
  provisioner "remote-exec" {
    inline = [
      "${var.update_packages[var.package_manager]}",
      "${var.install_packages[var.package_manager]} ${join(" ", var.packages)}"
    ]
  }
  provisioner "remote-exec" {
    scripts = "${var.scripts["poolapi"]}"
  }
}
