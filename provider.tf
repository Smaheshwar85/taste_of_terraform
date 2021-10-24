provider "google" {
  credentials = base64decode("${file("/var/lib/jenkins/creds/serviceaccount.json")}")
  project     = "terra-world-98561"
  region      = "europe-west1"
} 
