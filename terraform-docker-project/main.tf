# 1. Define the required provider (Docker)
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# 2. Pull the Nginx Docker Image
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# 3. Create and Run the Docker Container
resource "docker_container" "nginx_container" {
  name  = "my-local-nginx-server"
  image = docker_image.nginx_image.name
  
  # Map port 80 in the container to port 8080 on your local machine
  ports {
    internal = 80
    external = var.external_port
  }
}
