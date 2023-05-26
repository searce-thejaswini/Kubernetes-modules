<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.gke_standard_private](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google-beta_google_container_cluster.gke_standard_public](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google-beta_google_gke_hub_feature.mesh](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_feature) | resource |
| [google-beta_google_gke_hub_membership.membership](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_membership) | resource |
| [google_compute_network.gke-custom-vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.gke-custom-snet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_node_pool.gke1_app_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_container_node_pool.gke_app_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_project_service.anthos_service_mesh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [kubernetes_config_map.asm_options](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_namespace.system](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_compute_network.gke_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.my_subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |
| [google_container_cluster.asm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | By Enabling this nodes in this node pool will be monitored | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Enabling this keep the nodes in your node pool up to date with the latest release version of Kubernetes. | `bool` | `true` | no |
| <a name="input_binary_authorization"></a> [binary\_authorization](#input\_binary\_authorization) | Mode of operation for Binary Authorization policy evaluation | `string` | `"PROJECT_SINGLETON_POLICY_ENFORCE"` | no |
| <a name="input_channel"></a> [channel](#input\_channel) | The channel to use for this ASM installation. | `string` | `""` | no |
| <a name="input_cloudrun_config"></a> [cloudrun\_config](#input\_cloudrun\_config) | Disable cloudrun config addon | `bool` | `false` | no |
| <a name="input_cluster_autoscaling_enabled"></a> [cluster\_autoscaling\_enabled](#input\_cluster\_autoscaling\_enabled) | cluster autoscaling enable | `bool` | `true` | no |
| <a name="input_cluster_autoscaling_profile"></a> [cluster\_autoscaling\_profile](#input\_cluster\_autoscaling\_profile) | Cluster autoscaling profile | `string` | `"BALANCED"` | no |
| <a name="input_cluster_mode"></a> [cluster\_mode](#input\_cluster\_mode) | The cluster mode to execute private cluster or public cluster | `string` | `"public"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | Cluster type zonal/regional | `string` | `"zonal"` | no |
| <a name="input_clustername"></a> [clustername](#input\_clustername) | The name of the cluster | `string` | `"wordpress"` | no |
| <a name="input_create_system_namespace"></a> [create\_system\_namespace](#input\_create\_system\_namespace) | Determines whether the module creates the istio-system namespace. | `bool` | `true` | no |
| <a name="input_database_encryption"></a> [database\_encryption](#input\_database\_encryption) | Application-layer Secrets Encryption settings. The object format is {state = string, key\_name = string}. Valid values of state are: "ENCRYPTED"; "DECRYPTED". key\_name is the name of a CloudKMS key. | `string` | `"DECRYPTED"` | no |
| <a name="input_datapath_provider"></a> [datapath\_provider](#input\_datapath\_provider) | region for the GKE cluster | `string` | `"The desired datapath provider for this cluster. By default, `DATAPATH\_PROVIDER\_UNSPECIFIED` enables the IPTables-based kube-proxy implementation. `ADVANCED\_DATAPATH` enables Dataplane-V2 feature."` | no |
| <a name="input_default_max_pods_per_node"></a> [default\_max\_pods\_per\_node](#input\_default\_max\_pods\_per\_node) | The maximum number of pods to schedule per node | `number` | `100` | no |
| <a name="input_dns_cache_config"></a> [dns\_cache\_config](#input\_dns\_cache\_config) | Enable dns cache config addon | `bool` | `true` | no |
| <a name="input_enable_asm"></a> [enable\_asm](#input\_enable\_asm) | Enable Anthos Service Mesh | `bool` | `"true"` | no |
| <a name="input_enable_cni"></a> [enable\_cni](#input\_enable\_cni) | Determines whether to enable CNI for this ASM installation. Required to use Managed Data Plane (MDP). | `bool` | `false` | no |
| <a name="input_enable_fleet_registration"></a> [enable\_fleet\_registration](#input\_enable\_fleet\_registration) | Determines whether the module registers the cluster to the fleet. | `bool` | `true` | no |
| <a name="input_enable_integrity_monitoring"></a> [enable\_integrity\_monitoring](#input\_enable\_integrity\_monitoring) | Defines if the instance has integrity monitoring enabled | `bool` | `true` | no |
| <a name="input_enable_mesh_feature"></a> [enable\_mesh\_feature](#input\_enable\_mesh\_feature) | Determines whether the module enables the mesh feature on the fleet. | `bool` | `true` | no |
| <a name="input_enable_secure_boot"></a> [enable\_secure\_boot](#input\_enable\_secure\_boot) | Defines if the instance has Secure Boot enabled | `bool` | `true` | no |
| <a name="input_enable_shielded_nodes"></a> [enable\_shielded\_nodes](#input\_enable\_shielded\_nodes) | Enable Shielded Nodes features on all nodes in this cluster | `bool` | `true` | no |
| <a name="input_enable_vpc_sc"></a> [enable\_vpc\_sc](#input\_enable\_vpc\_sc) | Determines whether to enable VPC-SC for this ASM installation. For more information read https://cloud.google.com/service-mesh/docs/managed/vpc-sc | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the GKE cluster | `string` | `"production"` | no |
| <a name="input_fleet_id"></a> [fleet\_id](#input\_fleet\_id) | The fleet to use for this ASM installation. | `string` | `""` | no |
| <a name="input_gcp_filestore_csi_driver_config"></a> [gcp\_filestore\_csi\_driver\_config](#input\_gcp\_filestore\_csi\_driver\_config) | Disable gcp filestore csi  driver config addon | `bool` | `false` | no |
| <a name="input_gke_subnetwork"></a> [gke\_subnetwork](#input\_gke\_subnetwork) | Subnet where GKE will be deployed | `string` | `"default"` | no |
| <a name="input_gke_vpc_name"></a> [gke\_vpc\_name](#input\_gke\_vpc\_name) | VPC where GKE will be deployed | `string` | `"default"` | no |
| <a name="input_gpu_sharing_strategy"></a> [gpu\_sharing\_strategy](#input\_gpu\_sharing\_strategy) | The type of GPU sharing strategy to enable on the GPU node | `string` | `"TIME_SHARING"` | no |
| <a name="input_guest_accelerator_count"></a> [guest\_accelerator\_count](#input\_guest\_accelerator\_count) | The number of the guest accelerator cards exposed to this instance | `number` | `2` | no |
| <a name="input_guest_accelerator_type"></a> [guest\_accelerator\_type](#input\_guest\_accelerator\_type) | The accelerator type resource to expose to this instance | `string` | `"nvidia-tesla-k80"` | no |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | Enable horizontal pod autoscaling addon | `bool` | `false` | no |
| <a name="input_http_load_balancing"></a> [http\_load\_balancing](#input\_http\_load\_balancing) | Enable http load balancing addon | `bool` | `false` | no |
| <a name="input_initial_node_count"></a> [initial\_node\_count](#input\_initial\_node\_count) | The number of nodes to create in this cluster's default node pool. | `number` | `1` | no |
| <a name="input_internal_ip"></a> [internal\_ip](#input\_internal\_ip) | Use internal ip for the cluster endpoint when running kubectl commands. | `bool` | `false` | no |
| <a name="input_issue_client_certificate"></a> [issue\_client\_certificate](#input\_issue\_client\_certificate) | Issues a client certificate to authenticate to the cluster endpoint. To maximize the security of your cluster, leave this option disabled. Client certificates don't automatically rotate and aren't easily revocable. WARNING: changing this after cluster creation is destructive! | `bool` | `false` | no |
| <a name="input_istio_auth"></a> [istio\_auth](#input\_istio\_auth) | The authentication type between services in Istio | `string` | `"AUTH_MUTUAL_TLS"` | no |
| <a name="input_istio_config"></a> [istio\_config](#input\_istio\_config) | Environment for the GKE cluster | `bool` | `true` | no |
| <a name="input_logging_config"></a> [logging\_config](#input\_logging\_config) | List of services to monitor: SYSTEM\_COMPONENTS, WORKLOADS (provider version >= 3.89.0). Empty list is default GKE configuration. | `list(string)` | <pre>[<br>  "SYSTEM_COMPONENTS",<br>  "WORKLOADS"<br>]</pre> | no |
| <a name="input_maintenance_policy_maintenance_exclusion_end_time"></a> [maintenance\_policy\_maintenance\_exclusion\_end\_time](#input\_maintenance\_policy\_maintenance\_exclusion\_end\_time) | No | `string` | `"NO_UPGRADES"` | no |
| <a name="input_maintenance_policy_maintenance_exclusion_exclusion_name"></a> [maintenance\_policy\_maintenance\_exclusion\_exclusion\_name](#input\_maintenance\_policy\_maintenance\_exclusion\_exclusion\_name) | No | `string` | `"gke-maintainance-exclusion"` | no |
| <a name="input_maintenance_policy_maintenance_exclusion_exclusion_options_scope"></a> [maintenance\_policy\_maintenance\_exclusion\_exclusion\_options\_scope](#input\_maintenance\_policy\_maintenance\_exclusion\_exclusion\_options\_scope) | No | `string` | `"FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"` | no |
| <a name="input_maintenance_policy_maintenance_exclusion_start_time"></a> [maintenance\_policy\_maintenance\_exclusion\_start\_time](#input\_maintenance\_policy\_maintenance\_exclusion\_start\_time) | No | `string` | `"2019-01-01T00:00:00Z"` | no |
| <a name="input_maintenance_policy_recurring_window_end_time"></a> [maintenance\_policy\_recurring\_window\_end\_time](#input\_maintenance\_policy\_recurring\_window\_end\_time) | No | `string` | `"2019-01-01T17:00:00Z"` | no |
| <a name="input_maintenance_policy_recurring_window_recurrence"></a> [maintenance\_policy\_recurring\_window\_recurrence](#input\_maintenance\_policy\_recurring\_window\_recurrence) | No | `string` | `"FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"` | no |
| <a name="input_maintenance_policy_recurring_window_start_time"></a> [maintenance\_policy\_recurring\_window\_start\_time](#input\_maintenance\_policy\_recurring\_window\_start\_time) | No | `string` | `"2019-01-01T09:00:00Z"` | no |
| <a name="input_master_authorized_cidr_block"></a> [master\_authorized\_cidr\_block](#input\_master\_authorized\_cidr\_block) | n/a | `string` | `"172.24.0.0/13"` | no |
| <a name="input_master_authorized_display_name"></a> [master\_authorized\_display\_name](#input\_master\_authorized\_display\_name) | n/a | `string` | `"my_ip"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IP range in CIDR notation to use for the hosted master network | `string` | `"10.8.1.0/28"` | no |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | Minimum Node Count | `number` | `3` | no |
| <a name="input_max_shared_clients_per_gpu"></a> [max\_shared\_clients\_per\_gpu](#input\_max\_shared\_clients\_per\_gpu) | The maximum number of containers that can share a GPU. | `number` | `5` | no |
| <a name="input_max_surge"></a> [max\_surge](#input\_max\_surge) | The maximum number of nodes that can be created beyond the current size of the node pool during the upgrade process | `number` | `0` | no |
| <a name="input_max_unavailable"></a> [max\_unavailable](#input\_max\_unavailable) | The maximum number of nodes that can be simultaneously unavailable during the upgrade process | `number` | `0` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | Minimum Node Count | `number` | `1` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on.  If multiple, all items must be the same type. | `list(any)` | `[]` | no |
| <a name="input_monitoring_config"></a> [monitoring\_config](#input\_monitoring\_config) | List of services to monitor: SYSTEM\_COMPONENTS, WORKLOADS (provider version >= 3.89.0). Empty list is default GKE configuration. | `list(string)` | <pre>[<br>  "SYSTEM_COMPONENTS",<br>  "WORKLOADS"<br>]</pre> | no |
| <a name="input_multicluster_mode"></a> [multicluster\_mode](#input\_multicluster\_mode) | [Preview] Determines whether remote secrets should be autogenerated across fleet cluster. | `string` | `"manual"` | no |
| <a name="input_network_policy_config"></a> [network\_policy\_config](#input\_network\_policy\_config) | Enable network policy config addon | `bool` | `false` | no |
| <a name="input_networking_mode"></a> [networking\_mode](#input\_networking\_mode) | The networking\_mode determines whether alias IPs or routes will be used for pod IPs in the cluster | `string` | `"VPC_NATIVE"` | no |
| <a name="input_node_config_disk_size_gb"></a> [node\_config\_disk\_size\_gb](#input\_node\_config\_disk\_size\_gb) | Size of the disk attached to each node | `number` | `100` | no |
| <a name="input_node_config_disk_type"></a> [node\_config\_disk\_type](#input\_node\_config\_disk\_type) | Type of the disk attached to each node | `string` | `"pd-standard"` | no |
| <a name="input_node_config_image_type"></a> [node\_config\_image\_type](#input\_node\_config\_image\_type) | The image type used once a new node pool is being created. | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_node_config_machine_type"></a> [node\_config\_machine\_type](#input\_node\_config\_machine\_type) | Google Compute Engine machine type | `string` | `"e2-medium"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `number` | `1` | no |
| <a name="input_node_locations"></a> [node\_locations](#input\_node\_locations) | The region where the GKE will be deployed | `list(string)` | <pre>[<br>  "asia-southeast1-b",<br>  "asia-southeast1-c"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project where the GKE will be deployed | `string` | `"terraformering"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the GKE will be deployed | `string` | `"asia-southeast1"` | no |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED`. | `string` | `"UNSPECIFIED"` | no |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | Donot remove default node pool while setting up the cluster | `bool` | `true` | no |
| <a name="input_resourcelimits"></a> [resourcelimits](#input\_resourcelimits) | n/a | <pre>list(object({<br>    resource_type = string<br>    minimum = number<br>    maximum = number<br>  }))</pre> | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Defines if service account specified to run nodes should be created | `string` | `"default"` | no |
| <a name="input_service_external_ips_config"></a> [service\_external\_ips\_config](#input\_service\_external\_ips\_config) | Whether external ips specified by a service will be allowed in this cluster | `bool` | `true` | no |
| <a name="input_vertical_pod_autoscaling"></a> [vertical\_pod\_autoscaling](#input\_vertical\_pod\_autoscaling) | Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->