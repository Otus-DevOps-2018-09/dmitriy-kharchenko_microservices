variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "docker"
}

variable "zone" {
  description = "Zone"
  default     = "europe-west1-b"
}

variable "project" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
  default     = "europe-west1"
}

variable "instances_count" {
  description = "Count docker instances"
  default     = 1
}
