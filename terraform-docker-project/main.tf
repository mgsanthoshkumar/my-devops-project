# main.tf

# 1. Define the required provider (Docker)
# This ensures Terraform knows how to interact with your local Docker environment.
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# 2. Pull the Nginx Docker Image
# This defines the base image for our web server.
resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

# 3. Create and Run the Docker Container
# This provisions the actual server instance.
resource "docker_container" "nginx_container" {
  name  = "my-local-nginx-server"
  image = docker_image.nginx_image.name
  
  # Use the variable defined in variables.tf for the external port.
  # This makes the config reusable and easily changed without editing this file.
  ports {
    internal = 80
    external = var.external_port 
  }
}
