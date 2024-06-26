module "kube" {
  source     = "github.com/terraform-yc-modules/terraform-yc-kubernetes.git"
  network_id = var.network_id

  master_locations  = [
    for s in module.yc-vpc.private_subnets:
      {
        zone      = s.zone,
        subnet_id = s.subnet_id
      }
    ]

  master_maintenance_windows = [
    {
      day        = "monday"
      start_time = "23:00"
      duration   = "3h"
    }
  ]

  node_groups = {
    "yc-k8s-ng-01"  = {
      description   = "Kubernetes nodes group 01"
      auto_scale    = {
        min         = var.auto_scale_min
        max         = var.auto_scale_max
        initial     = var.auto_scale_initial
      }
      node_labels   = {
        role        = var.node_labels_role
        environment = var.node_labels_env
      }

      max_expansion   = 1
      max_unavailable = 1
    }
  }
}
