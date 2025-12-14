output "project_id" {
  description = "The unique ID of the created project"
  value       = google_project.infra_static_assets.project_id
}

output "project_number" {
  description = "The numeric identifier of the project"
  value       = google_project.infra_static_assets.number
}

output "project_console_url" {
  description = "Link to the Project Dashboard in Google Cloud Console"
  value       = "https://console.cloud.google.com/home/dashboard?project=${google_project.infra_static_assets.project_id}"
}

output "course_certificates_bucket_name" {
  description = "The specific name of the created bucket"
  value       = google_storage_bucket.course_certificates.name
}

output "course_certificates_console_url" {
  description = "Link to view the course-certificates bucket in the Google Cloud Console"
  value       = "https://console.cloud.google.com/storage/browser/${google_storage_bucket.course_certificates.name}"
}
