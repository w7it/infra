resource "yandex_iam_service_account" "website" {
  name = "website"
}

resource "yandex_iam_service_account_static_access_key" "website-static-key" {
  service_account_id = yandex_iam_service_account.website.id
}

resource "yandex_resourcemanager_folder_iam_member" "admin-account-iam" {
  folder_id = yandex_iam_service_account.website.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.website.id}"
}
