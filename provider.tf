variable "path"{
  default="./tmp/secretfiles/ba2e1ace-149d-4e90-b517-e3be3cdf372f"
}
provider "google" {
  
  project     = "terra-world-98561"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("${var.path}/terra-world-98561-dd9362aeee17.json")}"
} 
