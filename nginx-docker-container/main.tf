# TERRAFORM BLOCK
terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}

# PROVIDER BLOCK
provider "docker" {}

# RESOURCE BLOCK "RESOURCE_TYPE" "RESOURCE_NAME"
resource "docker_image" "nginx" {
    name = "nginx"
    keep_locally = false
}

# RESOURCE BLOCK "RESOURCE_TYPE" "RESOURCE_NAME"
resource "docker_container" "nginx" {
    image = docker_image.nginx.image_id
    name = "demo"

    ports {
        internal = 80
        external = 8000
        ip = "0.0.0.0"
        protocol = "tcp"
    }
}
