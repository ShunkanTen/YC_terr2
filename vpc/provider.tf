provider "yandex" {
  zone = "ru-central1-a"
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  service_account_key_file = file("../vadimg.json")
}
