provider "google" {
  credentials = "${file("/var/lib/jenkins/creds/serviceaccount.json")}"
  project     = "terra-world-98561"
  region      = "europe-west1"
} 
