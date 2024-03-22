# Step 1: Create the Logging Sink in the Source Project
resource "google_logging_project_sink" "example_sink" {
  project       = var.source_project_id
  name          = "example-sink"
  destination   = "logging.googleapis.com/projects/data-engineering-demo-413211/locations/us-central1/buckets/centerLOG"
  filter        = "severity >= ERROR"
}

# Step 2: Extract Writer Identity using External Data Source
data "external" "get_writer_identity" {
  program = ["${path.module}/get_writer_identity.sh", var.source_project_id, google_logging_project_sink.example_sink.name]
}

# Step 3: Create the Custom Service Account and Assign Writer Identity
resource "google_service_account" "custom_service_account" {
  project = var.destination_project_id
  account_id = "terraform-${data.external.get_writer_identity.result}"
  display_name = "Custom Service Account"

  # Assign the writer identity extracted from the logging sink
  
}
#C:\tf-workspace\terraform123\get_writer_identity.sh

# Outputs
output "custom_service_account_id" {
  value = google_service_account.custom_service_account.account_id
}
