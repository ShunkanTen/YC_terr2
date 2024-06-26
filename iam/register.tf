resource "yandex_iam_service_account" "k8s-sa" {
  description = "Service account to manage the Kubernetes cluster and node group"
  name        = var.sa_kube
}

# Assign "editor" role to Kubernetes service account
resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = var.folder_id
  role      = "editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
  ]
}

# Assign "container-registry.images.puller" role to Kubernetes service account
resource "yandex_resourcemanager_folder_iam_binding" "images-puller" {
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
  ]
}

# Assign "container-registry.images.pusher" role to Kubernetes service account
resource "yandex_resourcemanager_folder_iam_binding" "images-pusher" {
  folder_id = var.folder_id
  role      = "container-registry.images.pusher"
  members = [
    "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
  ]
}