locals{
    anthos_service_apis = ["mesh.googleapis.com", "gkehub.googleapis.com"]
}
resource "google_project_service" "anthos_service_mesh" {
  count   = length(local.anthos_service_apis)
  project = var.project_id
  service = local.anthos_service_apis[count.index]
}

# resource "google_project_service" "anthos_service_mesh" {
#   count   = var.enable_asm ? 1 : 0
#   project = var.project_id
#   service = "mesh.googleapis.com"
# }

# resource "google_project_service" "anthos_gke_hub" {
#   count   = var.enable_asm ? 1 : 0
#   project = var.project_id
#   service = "gkehub.googleapis.com"
#   disable_dependent_services = true
# }

resource "google_gke_hub_membership" "membership" {
  count         = var.enable_asm ? 1 : 0
  provider      = google-beta
  project       = var.project_id
  membership_id = "${data.google_container_cluster.asm.name}-membership"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${data.google_container_cluster.asm.id}"
    }
  }
  # depends_on = [
  #   google_project_service.anthos_gke_hub
  # ]
}

resource "google_gke_hub_feature" "mesh" {
  count    = var.enable_asm ? 1 : 0
  name     = "servicemesh"
  project  = var.project_id
  location = "global"
  provider = google-beta

  # depends_on = [
  #   google_project_service.anthos_gke_hub
  # ]
}

resource "kubernetes_namespace" "system" {
  count = var.enable_asm ? 1 : 0

  metadata {
    name = "istio-system"
  }
}

resource "kubernetes_config_map" "asm_options" {
  metadata {
    name      = "asm-options"
    namespace = try(kubernetes_namespace.system[0].metadata[0].name, "istio-system")
  }

  data = {
    multicluster_mode = true
    ASM_OPTS          = "CNI=on"
  }

  depends_on = [google_gke_hub_membership.membership, google_gke_hub_feature.mesh]
}










# # # module "cpr" {
# # #   source  = "terraform-google-modules/gcloud/google//modules/kubectl-wrapper"
# # #   version = "~> 3.1"

# # #   project_id       = var.project_id
# # #   cluster_name     = var.cluster_name
# # #   cluster_location = var.cluster_location
# # #   internal_ip      = var.internal_ip

# # #   kubectl_create_command  = "${path.module}/scripts/create_cpr.sh ${local.revision_name} ${local.channel} ${var.enable_cni} ${var.enable_vpc_sc}"
# # #   kubectl_destroy_command = "${path.module}/scripts/destroy_cpr.sh ${local.revision_name}"

# # #   module_depends_on = [kubernetes_config_map.asm_options]
# # # }




# # # output "revision_name" {
# # #   value       = local.revision_name
# # #   description = "The name of the installed managed ASM revision."
# # # }

# # # output "wait" {
# # #   value       = module.cpr.wait
# # #   description = "An output to use when depending on the ASM installation finishing."
# # # }
