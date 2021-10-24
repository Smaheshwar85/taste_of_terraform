provider "google" {
  credentials = "${file("./terra-world-98561-ba4ee487ee90.json")}"
  project     = "terra-world-98561"
  region      = "europe-west1"
} 
