variable "path"{
  default="/var/lib/jenkins/creds"
}
provider "google" {
  
  project     = "terra-world-98561"
  region      = "europe-west1"
  credentials = "${file("${var.path}/serviceaccount.json")}"
} 
