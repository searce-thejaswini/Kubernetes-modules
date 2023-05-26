variable "environment" {
  type = string
  default = "production"
  description = "Environment for the GKE cluster"
}

variable "project_id" {
  type = string
  default = "terraformering"
  description = "The project where the GKE will be deployed"
}

variable "region" {
  type = string
  default = "asia-southeast1"
  description = "The region where the GKE will be deployed"
  }
variable "node_locations" {
  type = list(string)
  default = ["asia-southeast1-b", "asia-southeast1-c"]
  description = "The region where the GKE will be deployed"
  }

variable "cluster_type" {
  type        = string
  description = "Cluster type zonal/regional"
  default     = "zonal"
}

variable "clustername" {
  type = string
  default = "wordpress"
  description = "The name of the cluster"
}


variable "gke_vpc_name" {
  type = string
  default = "default"
  description = "VPC where GKE will be deployed"
}

variable "gke_subnetwork" {
  type = string
  default = "default"
  description = "Subnet where GKE will be deployed"
}

variable "cluster_mode" {
  type = string
  default = "public"
  description = "The cluster mode to execute private cluster or public cluster"
}
variable "logging_config" {
  type = list(string)
  default = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  description = "List of services to monitor: SYSTEM_COMPONENTS, WORKLOADS (provider version >= 3.89.0). Empty list is default GKE configuration."
  }
variable "monitoring_config" {
  type = list(string)
  default = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  description = "List of services to monitor: SYSTEM_COMPONENTS, WORKLOADS (provider version >= 3.89.0). Empty list is default GKE configuration."
  }
variable "datapath_provider" {
  type = string
  default = "The desired datapath provider for this cluster. By default, `DATAPATH_PROVIDER_UNSPECIFIED` enables the IPTables-based kube-proxy implementation. `ADVANCED_DATAPATH` enables Dataplane-V2 feature."
  description = "region for the GKE cluster"
  }
# variable "network_policy_enable"{
#   type = bool
#   default = true
#   description = "Enable network policy addon"
# }
variable "enable_shielded_nodes" {
  type = bool
  default = true
  description = "Enable Shielded Nodes features on all nodes in this cluster"
}

variable "initial_node_count" {
  type = number
  default = 1
  description = "The number of nodes to create in this cluster's default node pool."
}
variable "default_max_pods_per_node" {
  type = number
  default = 100
  description = "The maximum number of pods to schedule per node"
}
variable "remove_default_node_pool" {
  type = bool
  default = true
  description = "Donot remove default node pool while setting up the cluster"
}
variable "networking_mode" {
  type = string
  default = "VPC_NATIVE"
  description = "The networking_mode determines whether alias IPs or routes will be used for pod IPs in the cluster"
}
variable "istio_config" {
  type = bool
  default = true
  description = "Environment for the GKE cluster"
}
variable "istio_auth" {
  type = string
  default = "AUTH_MUTUAL_TLS"
  description = "The authentication type between services in Istio"
}
variable "resourcelimits" {
  type = list(object({
    resource_type = string
    minimum = number
    maximum = number
  }))
}
variable "cluster_autoscaling_profile" {
  type = string
  default = "BALANCED"
  description = "Cluster autoscaling profile"
}

variable "cluster_autoscaling_enabled" {
  type = bool
  default = true
  description = "cluster autoscaling enable"
}
# variable "recurring_window_start_time" {
#   type = 
  
# }
variable "maintenance_policy_recurring_window_start_time" {
  type = string
  default = "2019-01-01T09:00:00Z"
  description = "No"
  
}
variable "maintenance_policy_recurring_window_end_time" {
  type = string
  default = "2019-01-01T17:00:00Z"
  description = "No"
  
}
variable "maintenance_policy_recurring_window_recurrence" {
  type = string
  default = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"
  description = "No"
  
}
variable "maintenance_policy_maintenance_exclusion_start_time" {
  type = string
  default = "2019-01-01T00:00:00Z"
  description = "No"
  
}
variable "maintenance_policy_maintenance_exclusion_exclusion_name" {
  type = string
  default = "gke-maintainance-exclusion"
  description = "No"
  
}
variable "maintenance_policy_maintenance_exclusion_exclusion_options_scope" {
  type = string
  default = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"
  description = "No"
  
}
variable "maintenance_policy_maintenance_exclusion_end_time" {
  type = string
  default = "NO_UPGRADES"
  description = "No"
  
}

# variable "maintenance_policy" {
#   type = object({
#     recurring_window = object({
#       start_time = string
#       end_time = string
#       recurrence = string
#     })
#     maintenance_exclusion = object({
#       exclusion_name = string
#       start_time = string
#       end_time = string
#       exclusion_options = object({
#         scope = string
#       })
#     })
#   })
#   default = {
#     recurring_window = {
#       start_time = "2019-01-01T09:00:00Z"
#       end_time = "2019-01-01T17:00:00Z"
#       recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"
#     }
#     maintenance_exclusion = {
#       exclusion_name = "gke-maintainance-exclusion"
#       start_time = "2019-01-01T00:00:00Z"
#       end_time = "2019-01-02T00:00:00Z"
#       exclusion_options = {
#         scope = "NO_UPGRADES"
#       }
#     }
#   }
# }
variable "horizontal_pod_autoscaling" {
  type = bool
  default = false
  description = "Enable horizontal pod autoscaling addon"
  }
variable "http_load_balancing" {
  type = bool
  default = false
  description = "Enable http load balancing addon"
  }
variable "network_policy_config" {
  type = bool
  default = false
  description = "Enable network policy config addon"
  }
variable "gcp_filestore_csi_driver_config" {
  type = bool
  default = false
  description = "Disable gcp filestore csi  driver config addon"
  }
variable "cloudrun_config" {
  type = bool
  default = false
  description = "Disable cloudrun config addon "
  }
variable "dns_cache_config" {
  type = bool
  default = true
  description = "Enable dns cache config addon "
  }
variable "binary_authorization" {
  type = string
  default = "PROJECT_SINGLETON_POLICY_ENFORCE"
  description = "Mode of operation for Binary Authorization policy evaluation"
}
variable "service_external_ips_config" {
  type = bool
  default = true
  description = "Whether external ips specified by a service will be allowed in this cluster"
}
variable "issue_client_certificate" {
  type = bool
  default = false
  description = "Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive!"
}
variable "database_encryption" {
  type = string
  default = "DECRYPTED"
  description = "Application-layer Secrets Encryption settings. The object format is {state = string, key_name = string}. Valid values of state are: \"ENCRYPTED\"; \"DECRYPTED\". key_name is the name of a CloudKMS key."
}
variable "vertical_pod_autoscaling" {
  type = bool
  default = false
  description = "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it"
}
variable "release_channel" {
  type    = string
  default = "UNSPECIFIED"
  description = "The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED`."
}
variable "master_ipv4_cidr_block" {
  type = string
  default = "10.8.1.0/28"
  description = "The IP range in CIDR notation to use for the hosted master network"
  }
variable "master_authorized_cidr_block" {
  type = string
  default = "172.24.0.0/13"
  description = ""
  }
variable "master_authorized_display_name" {
  type = string
  default = "my_ip"
  }
#############################################################################################################################################
# variable "node_config" {
#   type = list(string)
#   default = "[machine_type,image_type disk_type]"
#   }
variable "node_config_machine_type" {
  type = string
  default = "e2-medium"
  description = "Google Compute Engine machine type"
  }
variable "node_config_image_type" {
  type = string
  default = "COS_CONTAINERD"
  description = "The image type used once a new node pool is being created."
  }
variable "node_config_disk_type" {
  type = string
  default = "pd-standard"
  description = "Type of the disk attached to each node"
  }
variable "node_config_disk_size_gb" {
  type = number
  default = 100
  description = "Size of the disk attached to each node"
  }

variable "min_node_count" {
  type = number
  default = 1
  description = "Minimum Node Count"
}
variable "max_node_count" {
  type = number
  default = 3
  description = "Minimum Node Count"
}
variable "auto_repair" {
  type = bool
  default = true
  description = "By Enabling this nodes in this node pool will be monitored"
}
variable "auto_upgrade" {
  type = bool
  default = true
  description = "Enabling this keep the nodes in your node pool up to date with the latest release version of Kubernetes."
}
variable "max_surge" {
  type = number
  default = 0
  description = "The maximum number of nodes that can be created beyond the current size of the node pool during the upgrade process"
}
variable "max_unavailable" {
  type = number
  default = 0
  description = "The maximum number of nodes that can be simultaneously unavailable during the upgrade process"
}
variable "node_count" {
  type = number
  default = 1
  description = ""
}
variable "enable_integrity_monitoring" {
  type = bool
  default = true
  description = "Defines if the instance has integrity monitoring enabled"
}
variable "enable_secure_boot" {
  type = bool
  default = true
  description = "Defines if the instance has Secure Boot enabled"
}
variable "service_account" {
  type = string
  default = "default"
  description = "Defines if service account specified to run nodes should be created"
}
variable "guest_accelerator_type" {
  type = string
  default = "nvidia-tesla-k80"
  description = "The accelerator type resource to expose to this instance"
}
variable "guest_accelerator_count" {
  type = number
  default = 2
  description = "The number of the guest accelerator cards exposed to this instance"
}
variable "gpu_sharing_strategy" {
  type = string
  default = "TIME_SHARING"
  description = "The type of GPU sharing strategy to enable on the GPU node"
}
variable "max_shared_clients_per_gpu" {
  type = number
  default = 5
  description = "The maximum number of containers that can share a GPU."
}
variable "enable_asm" {
  type        = bool
  description = "Enable Anthos Service Mesh"
  default     = "true"
}

variable "fleet_id" {
  description = "The fleet to use for this ASM installation."
  type        = string
  default     = ""
}

variable "channel" {
  description = "The channel to use for this ASM installation."
  type        = string
  validation {
    condition = anytrue([
      var.channel == "rapid",
      var.channel == "regular",
      var.channel == "stable",
      var.channel == "", // if unset, use GKE data source and use release cluster channel
    ])
    error_message = "Must be one of rapid, regular, or stable."
  }
  default = ""
}

variable "multicluster_mode" {
  description = "[Preview] Determines whether remote secrets should be autogenerated across fleet cluster."
  type        = string
  validation {
    condition = anytrue([
      var.multicluster_mode == "manual",
      var.multicluster_mode == "connected",
    ])
    error_message = "Must be one of manual or connected."
  }
  default = "manual"
}

variable "enable_cni" {
  description = "Determines whether to enable CNI for this ASM installation. Required to use Managed Data Plane (MDP)."
  type        = bool
  default     = false
}
variable "enable_vpc_sc" {
  description = "Determines whether to enable VPC-SC for this ASM installation. For more information read https://cloud.google.com/service-mesh/docs/managed/vpc-sc"
  type        = bool
  default     = true
}

variable "enable_fleet_registration" {
  description = "Determines whether the module registers the cluster to the fleet."
  type        = bool
  default     = true
}

variable "enable_mesh_feature" {
  description = "Determines whether the module enables the mesh feature on the fleet."
  type        = bool
  default     = true
}
variable "internal_ip" {
  description = "Use internal ip for the cluster endpoint when running kubectl commands."
  type        = bool
  default     = false
}
variable "module_depends_on" {
  description = "List of modules or resources this module depends on.  If multiple, all items must be the same type."
  type        = list(any)
  default     = []
}

variable "create_system_namespace" {
  description = "Determines whether the module creates the istio-system namespace."
  type        = bool
  default     = true
}


# variable "guest_accelerator" {
#   type = object({ 
#     guest_accelerator_type = string
#     guest_accelerator_count = number 
    
#   })
    
#     gpu_sharing_config = object({
#       gpu_sharing_strategy = string
#       max_shared_clients_per_gpu = number
    
#     })
# }
# default = {
#       guest_accelerator_type = "nvidia-tesla-k80"
#       guest_accelerator_count = 2
#     }
#     gpu_sharing_config = {
#       gpu_sharing_strategy = "TIME_SHARING"
#       max_shared_clients_per_gpu = 5
#     }
  
#  variable "node_config" {
#    type = object({
#     preemptible  = bool
#     machine_type = string
#     image_type   = string
#     disk_type    = string
#     disk_size_gb = number
#    })
#  }
  



