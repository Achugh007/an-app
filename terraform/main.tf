# Provider and backend
provider "google" {
  project     = "sks001"
  region      = "us-central1" # Or your preferred region
}

terraform {
  backend "gcs" {
    bucket = "sks-terraform" 
    prefix = "terraform/state"
  }
}

# Variables
variable "environment_name" {}

# Kubernetes cluster
resource "google_container_cluster" "primary" {
  name               = "${var.environment_name}-cluster"
  location           = var.region
  initial_node_count = 1

  # Add any additional cluster configuration you need (e.g., node pools, etc.)
}
