provider "google" {
  credentials = "${var.credentials}"
  project     = "${var.project}"
  region      = "us-central1"
}

resource "google_compute_instance" "docker_host" {
  name         = "${var.instance_name}"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["docker-host"]

  boot_disk {
    initialize_params {
      image = "docker-base"
    }
  }

  network_interface {
    network = "default"

    access_config = {}
  }

  connection {
    type        = "ssh"
    user        = "${var.remote_user}"
    agent       = false
    private_key = "${var.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo docker run --rm -d -p 9292:9292 --name nginx ${var.docker_image}",
    ]
  }
}
