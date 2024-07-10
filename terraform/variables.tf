# variables.tf
variable "region" {
  type        = string
  description = "The GCP region where resources will be created"
  default     = "us-central1"  # Set your preferred default region here
}
