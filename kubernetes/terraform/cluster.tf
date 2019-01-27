provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "europe-west1"
}

resource "google_container_cluster" "primary" {
  name               = "marcellus-wallace"
  zone               = "europe-west1-b"
  initial_node_count = 2

  additional_zones = [
    "europe-west1-c"
  ]

  master_auth {
    username = "${var.login}"
    password = "${var.password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
