resource "google_compute_network" "gke-custom-vpc" {
  project = var.project_id
  name                    = "test-network"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "gke-custom-snet" {
  project = var.project_id
  name          = "test-subnetwork"
  ip_cidr_range = "10.8.0.0/24"
  region        = var.region
  network       = google_compute_network.gke-custom-vpc.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.10.5.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "10.10.6.0/24"
  }
}
