resource "yandex_vpc_network" "this" {
    name = var.vpc_name
    description = "net_for_vm"
}

resource "yandex_vpc_subnet" "this" {
    name =  "kittygram-network-sub"
    description = "KittyGram Subnet Network"
    zone = var.ycloud_zone
    v4_cidr_blocks = ["10.0.1.0/24"]
    network_id = yandex_vpc_network.this.id
}


resource "yandex_vpc_security_group" "this" {
  name        = "kittygram-security-group"
  description = "Security group for Kittygram"
  network_id  = yandex_vpc_network.this.id

  egress {
    protocol       = "ANY"
    description    = "All outbound traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTP Gateway"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
}


resource "yandex_compute_disk" "this" {
  name     = var.vm_1_name
  zone     = var.ycloud_zone
  size     = 15
  image_id = var.image_id
}

resource "yandex_compute_instance" "this" {
  name                      = var.vm_1_name
  allow_stopping_for_update = true
  platform_id               = "standard-v3"
  zone                      = var.ycloud_zone

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    disk_id = yandex_compute_disk.this.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this.id
    security_group_ids = [yandex_vpc_security_group.this.id]
    nat = true
  }

  metadata = {
        "user-data" = templatefile("./cloud-init.yml", { USER = var.user, vm_ssh_key = var.vm_ssh_key }),
        ssh-keys  = var.vm_ssh_key
    }
  }