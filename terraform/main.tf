# main.tf
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" 
    }
  }
}

provider "google" {
  project     = "sks001"
  region      = "us-central1" # Or your preferred region
}

variable "environment_name" {
  type        = string
  description = "Name of the environment (derived from branch name)"
}

resource "google_container_cluster" "primary" {
  # Construct a valid cluster name using the environment variable and the fixed prefix "sks-cluster-"
  name               = "sks-cluster-${lower(replace(var.environment_name, "/[^a-z0-9-]/", ""))}"
  location           = var.region
  initial_node_count = 1
  remove_default_node_pool = true

  # (Optional) Customize your cluster settings here, like adding node pools.
}
