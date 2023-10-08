
resource "yandex_storage_bucket" "huntassessment_ru" {
  access_key = yandex_iam_service_account_static_access_key.website-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.website-static-key.secret_key
  bucket     = "huntassessment.ru"
  acl        = "public-read"

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  https {
    certificate_id = yandex_cm_certificate.huntassessment.id
  }
}
