resource "google_storage_bucket" "course_certificates" {
  name          = "course-certificates-${random_integer.suffix.result}"
  location      = "EUROPE-WEST2"
  force_destroy = false
  project       = google_project.infra_static_assets.project_id
  storage_class = "STANDARD"

  public_access_prevention    = "inherited"
  uniform_bucket_level_access = true

  hierarchical_namespace {
    enabled = false
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  versioning {
    enabled = false
  }

  labels = {
    service    = "infra-static-assets"
    data_class = "public"
  }
}

resource "google_storage_bucket_iam_member" "public_blind_reader" {
  bucket = google_storage_bucket.course_certificates.name
  role   = "roles/storage.legacyObjectReader"
  member = "allUsers"
}