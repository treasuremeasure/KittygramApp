variable "vpc_name" {
    description = "VPC Name"
    type = string
    default = "infra-network"
}

variable "ycloud_subnet" {
    description = "CIDR For Subnet Yandex Cloud"
    type        = list(string)
    default     = ["10.2.0.0/16"]
}

variable "ycloud_zone" {
    description = "Zone ID For Yandex Cloud"
    type        = string
    default = "ru-central1-a"
}

variable "vm_1_name" {
    type = string
    default = "vm-kittygram"
}

variable "vm_ssh_key" {
    description = "SSH Key for Virtual Machine"
    type        = string
}

variable "cloud_id" {
  description = "Cloud ID"
  type = string
}

variable "folder_id" {
  description = "Folder ID"
  type = string
}

variable "image_id" {
  description = "Image for VM"
  type = string
}

variable "token" {
  description = "Token for service account"
  type = string
}

variable "user" {
  description = "VM user"
  type = string
}

variable "vm_ssh_passphrase" {
  description = "VM passphrase"
  type = string
}