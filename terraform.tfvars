project_id = "terraformering"
gke_vpc_name = "test-network"
gke_subnetwork = "test-subnetwork"
environment = "production"  
clustername = "wordpress"               
cluster_type = "zonal"                      
cluster_mode = "private"
region = "asia-southeast1"
node_locations = ["asia-southeast1-b", "asia-southeast1-c" ]
datapath_provider = "ADVANCED_DATAPATH"
logging_config = ["SYSTEM_COMPONENTS", "WORKLOADS"]
monitoring_config = ["SYSTEM_COMPONENTS", "WORKLOADS"]
default_max_pods_per_node = 10
remove_default_node_pool = true
initial_node_count       = 1
enable_shielded_nodes     = true
networking_mode = "VPC_NATIVE"
network_policy_enable = true
istio_config = true
istio_auth = "AUTH_MUTUAL_TLS"
resourcelimits = [{ resource_type = "cpu", minimum = 4, maximum = 8 }, { resource_type = "memory", minimum = 5, maximum = 10 } ]
cluster_autoscaling_profile = "BALANCED"
cluster_autoscaling_enabled = true
maintenance_policy_recurring_window_start_time = "2019-01-01T09:00:00Z"
maintenance_policy_recurring_window_end_time = "2019-01-01T17:00:00Z"
maintenance_policy_recurring_window_recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"
maintenance_policy_maintenance_exclusion_exclusion_name = "gke-maintainance-exclusion"
maintenance_policy_maintenance_exclusion_start_time = "2019-01-01T00:00:00Z"
maintenance_policy_maintenance_exclusion_end_time = "2019-01-02T00:00:00Z"
maintenance_policy_maintenance_exclusion_exclusion_options_scope = "NO_UPGRADES"
binary_authorization = "PROJECT_SINGLETON_POLICY_ENFORCE"
issue_client_certificate = false
master_ipv4_cidr_block = "10.8.1.0/28"
release_channel = "UNSPECIFIED"
horizontal_pod_autoscaling = false
http_load_balancing = false
network_policy_config = false
gcp_filestore_csi_driver_config = false
cloudrun_config = false
dns_cache_config = true
service_external_ips_config = true
database_encryption = "DECRYPTED"
vertical_pod_autoscaling = false
#############################################################################################
node_config_machine_type = "e2-medium"
node_config_image_type   = "COS_CONTAINERD"
node_config_disk_type    = "pd-standard"
node_config_disk_size_gb = 100
auto_repair = true
auto_upgrade = true
max_surge = 0
max_unavailable = 0
node_count = 1
enable_integrity_monitoring = true
enable_secure_boot = true
service_account = "terragrunt@terraformering.iam.gserviceaccount.com"
guest_accelerator_type = "nvidia-tesla-k80"
guest_accelerator_count = 2
gpu_sharing_strategy = "TIME_SHARING"
max_shared_clients_per_gpu = 5

