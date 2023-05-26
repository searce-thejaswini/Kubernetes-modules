resource "google_container_cluster" "gke_standard_private" {
  provider = google-beta
  count = var.cluster_mode == "private" ? 1 : 0
  project = var.project_id
  name     = "${var.clustername}-${var.environment}-gke-pvt-cluster-01"
  location = var.cluster_type == "regional" ? var.region : "${var.region}-a"
  node_locations = var.node_locations #setsubtract(data.google_compute_zones.available_zones.names, ["${var.region}-a","${var.region}-b","${var.region}-c","${var.region}-d","${var.region}-e"])
  default_max_pods_per_node = var.default_max_pods_per_node
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  enable_shielded_nodes     = var.enable_shielded_nodes
  datapath_provider         = var.datapath_provider  #CAN BE LEGACY_DATAPATH AS WELL
  networking_mode = var.networking_mode
  min_master_version        = "1.22.17-gke.8000"
  # provider                  = google-beta

  

  network = data.google_compute_network.gke_vpc.id
  subnetwork = data.google_compute_subnetwork.my_subnetwork.id

  ip_allocation_policy {
    cluster_secondary_range_name = google_compute_subnetwork.gke-custom-snet.secondary_ip_range.0.range_name
    services_secondary_range_name = google_compute_subnetwork.gke-custom-snet.secondary_ip_range.1.range_name
  }

  addons_config {

   horizontal_pod_autoscaling {
    disabled = var.horizontal_pod_autoscaling 
    }
   http_load_balancing {
    disabled = var.http_load_balancing
   }
   gcp_filestore_csi_driver_config {
     enabled = var.gcp_filestore_csi_driver_config
   }
   cloudrun_config {
     disabled = true
    #  load_balancer_type = LOAD_BALANCER_TYPE_INTERNAL
   }
   istio_config {
     disabled = var.istio_config
     auth = var.istio_auth
   }
   dns_cache_config {
     enabled = var.dns_cache_config
   }
  }
  cluster_autoscaling {
    autoscaling_profile = var.cluster_autoscaling_profile
    enabled = var.cluster_autoscaling_enabled
    

  dynamic "resource_limits" {
    for_each = var.resourcelimits

      content {
         resource_type  = resource_limits.value.resource_type
         minimum        = resource_limits.value.minimum
         maximum        = resource_limits.value.maximum
      }
    }
  }
    
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  binary_authorization {
    evaluation_mode = var.binary_authorization
  }
  
  service_external_ips_config {
    enabled = var.service_external_ips_config
  }
  logging_config {
   enable_components = var.logging_config
  }
 monitoring_config {
    enable_components = var.monitoring_config
   }
  maintenance_policy {
    recurring_window {
      start_time = var.maintenance_policy_recurring_window_start_time
      end_time = var.maintenance_policy_recurring_window_end_time
      recurrence = var.maintenance_policy_recurring_window_recurrence
    }

    maintenance_exclusion {
      exclusion_name = var.maintenance_policy_maintenance_exclusion_exclusion_name
      start_time = var.maintenance_policy_maintenance_exclusion_start_time
      end_time = var.maintenance_policy_maintenance_exclusion_end_time
      exclusion_options {
        scope = var.maintenance_policy_maintenance_exclusion_exclusion_options_scope
      }
    }
  }

master_auth {
  client_certificate_config {
    issue_client_certificate = false
      }
  }
  database_encryption {
    state = var.database_encryption
  }
 vertical_pod_autoscaling {
    enabled = var.vertical_pod_autoscaling
  }
    
 release_channel {
    channel = var.release_channel
  }
master_authorized_networks_config {
       cidr_blocks {
        cidr_block   = var.master_authorized_cidr_block
         display_name = var.master_authorized_display_name
       }
     }

      
  }
  
  

######################################################Node Pool################################################################################################

      


resource "google_container_node_pool" "gke1_app_node_pool" {
  count = var.cluster_mode == "private" ? 1 : 0
  project = var.project_id
  name       = "${var.clustername}-${var.environment}-01"
  location   = var.cluster_type == "regional" ? var.region : "${var.region}-a"
  cluster    = google_container_cluster.gke_standard_private[0].name
  node_count = var.node_count


  autoscaling {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }

  
  management {
    auto_repair = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }
  upgrade_settings {
    max_surge = var.max_surge
    max_unavailable = var.max_unavailable
  }
  
  node_config {
    preemptible  = false
    machine_type = var.node_config_machine_type
    image_type   = var.node_config_image_type
    disk_type    = var.node_config_disk_type
    disk_size_gb = var.node_config_disk_size_gb
  

    shielded_instance_config {
    enable_integrity_monitoring = var.enable_integrity_monitoring
    enable_secure_boot          = var.enable_secure_boot
   }

   guest_accelerator {
    type = var.guest_accelerator_type
    count = var.guest_accelerator_count 
    gpu_sharing_config{
      gpu_sharing_strategy = var.gpu_sharing_strategy 
       max_shared_clients_per_gpu = var.max_shared_clients_per_gpu 
     }
   }
   service_account = var.service_account
      oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", 
                        "https://www.googleapis.com/auth/logging.write", 
                        "https://www.googleapis.com/auth/monitoring", 
                        "https://www.googleapis.com/auth/service.management.readonly", 
                        "https://www.googleapis.com/auth/servicecontrol", 
                        "https://www.googleapis.com/auth/trace.append"]

  }
}



