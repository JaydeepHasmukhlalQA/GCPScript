provider "google" {
  credentials = "${file("~/gcp-week-246209-2f3d96a4d86f.json")}"
  project     = "${var.project}"
  region      = "europe-west2"
}
