terraform {
    backend "s3" {
        endpoint = "storage.yandexcloud.net"
        region = "ru-central1"

        bucket = "shunkan"
        key = "state"

        skip_region_validation = true
        skip_credentials_validation = true

        dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1ge9r1738nfvevpi3o7/etne40mb3oc7vbainjno"
        dynamodb_table = "shunkan"
        }
}
    