terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "moscow_time_app" {
  name         = var.app_image_name
  keep_locally = true
}

resource "docker_container" "moscow_time_app" {
  name  = var.python_container_name
  image = docker_image.moscow_time_app.image_id

  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
