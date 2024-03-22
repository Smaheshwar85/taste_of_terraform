variable "source_project_id" {
  description = "The ID of the source project where the logging sink will be created."
  default ="project-dev-416415"
}

variable "destination_project_id" {
  description = "The ID of the destination project where the Pub/Sub topic exists."
  default ="data-engineering-demo-413211"
}
