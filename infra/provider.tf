terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"


  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "bucket-for-state"
    region = "ru-central1-a"
    key    = "key/tf-state.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  } 

}

provider "yandex" {
  token = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.ycloud_zone
}