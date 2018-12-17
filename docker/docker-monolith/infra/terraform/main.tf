provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}
resource "google_compute_instance" "app" {
  name         = "reddit-docker-${count.index + 1}"
  machine_type = "g1-small"
  project      = "${var.project}"
  zone         = "${var.zone}"
  tags         = ["reddit-docker"]
  count        = "${var.instances_count}"

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-docker"]
}
