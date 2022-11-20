terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8001
  }

}

# 1: run 'terraform init' (more info on the readme file)
# 2.0: run 'terraform plan' to see what resorces terrafrom about to create/update/delete
# 2.1: run 'terraform apply'(more info on the readme file)
    # on 'Enter a value:' (Do you want to perform these actions?) type 'yes' (u can type 'yes' for yes or anything else for 'no')
# 3: go to 'http://localhost:8000/' to see your nginx server running
# 4: now 
