variable "path"{
  default="/var/tmp"
}
provider "google" {
  
  project     = "terra-world-98561"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("${var.path}/service-account.json")}"
} 
