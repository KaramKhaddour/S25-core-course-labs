variable "zone" {
  description = "Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "terraform-network"
}

variable "subnet_name" {
  description = "VPC subnet name"
  type        = string
  default     = "terraform-subnet"
}

variable "subnet_cidr_blocks" {
  description = "Subnet IPv4 CIDR blocks"
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "disk" {
  description = "Boot disk configuration"
  type = object({
    name     = string
    type     = string
    size     = number
    image_id = string
  })
  default = {
    name     = "terraform-boot-disk"
    type     = "network-hdd"
    size     = 20
    image_id = "fd865v46cboopthn7u0k"
  }
}

variable "vm" {
  description = "VM instance configuration"
  type = object({
    name          = string
    cores         = number
    memory        = number
    core_fraction = number
    nat           = bool
    preemptible   = bool
  })
  default = {
    name          = "terraform-vm"
    cores         = 2
    memory        = 2
    core_fraction = 20
    nat           = true
    preemptible   = true
  }
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder ID"
}

variable "cloud_id" {
  description = "Yandex Cloud cloud ID"
  type        = string
}

variable "token" {
  description = "Yandex Cloud OAuth token"
  type        = string
}

variable "ssh_key_path" {
  description = "Path to SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
