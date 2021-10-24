variable "path"{
  default="/var/lib/jenkins/workspace/taste_of_terraform@tmp/secretFiles/80855e8b-c72d-43bb-9d2b-48c8482c45ab"
}
provider "google" {
  
  project     = "terra-world-98561"
  region      = "europe-west1"
  credentials = "${file("${var.path}/terra-world-98561-ba4ee487ee90.json")}"
} 
