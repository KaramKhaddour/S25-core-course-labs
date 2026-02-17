terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.75"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id  
  zone      = var.zone
}

resource "yandex_vpc_network" "network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.subnet_cidr_blocks
}

resource "yandex_compute_disk" "boot_disk" {
  name     = var.disk.name
  type     = var.disk.type
  size     = var.disk.size
  zone     = var.zone
  image_id = var.disk.image_id
}

resource "yandex_compute_instance" "vm" {
  name = var.vm.name
  zone = var.zone

  resources {
    cores         = var.vm.cores
    memory        = var.vm.memory
    core_fraction = var.vm.core_fraction
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = var.vm.nat
  }

  scheduling_policy {
    preemptible = var.vm.preemptible
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }
}
