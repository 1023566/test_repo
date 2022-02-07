terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.8.0"
    }
  }
}

provider "google" {
  credentials = file("./my-terraform-project-339309-da9893a0e568.json")
  project     = "my-terraform-project-339309"
  region      = "us-central1"
  zone        = "us-central1-c"
}

/*
resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}
*/
data "google_compute_network" "my_network" {
  name = var.existing_vpc_name
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.vm_name}${count.index}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = data.google_compute_network.my_network.name
    access_config {
    }
  }
  
  count=2
  metadata = {
    name = "Server ${count.index}"
  }
}

resource "google_storage_bucket" "my-terraform-bucket" {
  name          = "my-terraform-bucket2-1023566"
  location      = "US"
  force_destroy = true
  project       = "my-terraform-project-339309"

}
