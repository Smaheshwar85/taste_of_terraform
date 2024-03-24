# Define the google_logging_project_bucket_config resource
resource "google_logging_project_bucket_config" "this" {
  project         = var.project_id
  location        = var.location
  retention_days  = var.retention_days
  bucket_id       = var.bucket_id
  description     = "center for all logs (Managed by Terraform)"
}

# Define the google_logging_project_sink resource
resource "google_logging_project_sink" "example_sink" {
  project     = var.project_id
  name        = var.sink_name
  destination = "logging.googleapis.com/projects/${var.project_id}/locations/${var.location}/buckets/${var.bucket_id}"
  filter      = var.sink_filter

  depends_on = [google_logging_project_bucket_config.this]
}

# Add the new service account as a member in the destination project
resource "google_project_iam_member" "this-bucket-writer" {
  project = var.project_id
  role    = var.role_bucket_writer
  member  = google_logging_project_sink.example_sink.writer_identity

  depends_on = [google_logging_project_sink.example_sink]
}

resource "google_project_iam_member" "this-view-accessors" {
  project = var.project_id
  role    = var.role_view_accessors
  member  = google_logging_project_sink.example_sink.writer_identity

  depends_on = [google_logging_project_sink.example_sink]
}

# Define IAM role bindings
resource "google_project_iam_binding" "this-logging-bucket-writer" {
  project = var.project_id
  role    = var.role_bucket_writer

  members = [google_logging_project_sink.example_sink.writer_identity]

  depends_on = [google_logging_project_sink.example_sink]
}

resource "google_project_iam_binding" "this-logging-view-accessors" {
  project = var.project_id
  role    = var.role_view_accessors

  members = [google_logging_project_sink.example_sink.writer_identity]

  depends_on = [google_logging_project_sink.example_sink]
}
