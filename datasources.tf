data "google_compute_network" "gke_vpc" {
    project = var.project_id
    name = var.gke_vpc_name

    depends_on = [
      google_compute_network.gke-custom-vpc
    ]
}

data "google_compute_subnetwork" "my_subnetwork" {
  project = var.project_id
  name   = var.gke_subnetwork
  region = var.region

  depends_on = [
    google_compute_subnetwork.gke-custom-snet
  ]
}

data "google_container_cluster" "asm" {
  project  = var.project_id
  #name     = var.cluster_mode == "private" ? "${var.clustername}-${var.environment}-gke-pvt-cluster-01" : "${var.clustername}-${var.environment}-gke-pub-cluster-011"
  name     = "${var.clustername}-${var.environment}-gke-pub-cluster-011"
  # location = var.cluster_type == "regional" ? var.region : "${var.region}-a"
  location   = var.region

  # depends_on = [google_container_cluster.gke_standard_private, google_container_cluster.gke_standard_public]
  depends_on = [ google_container_cluster.gke_standard_public ]

}

data "google_client_config" "default" {}


