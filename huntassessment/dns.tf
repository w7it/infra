resource "yandex_dns_zone" "huntassessment_ru" {
  name        = "huntassessment"
  description = "huntassessment.ru"

  zone             = "huntassessment.ru."
  public           = true
  private_networks = [yandex_vpc_network.default.id]
}

resource "yandex_dns_recordset" "huntassessment_ru_a" {
  zone_id = yandex_dns_zone.huntassessment_ru.id
  name    = "huntassessment.ru."
  type    = "ANAME"
  ttl     = 300
  data = [yandex_storage_bucket.huntassessment_ru.website_endpoint]
}

resource "yandex_dns_recordset" "huntassessment_ru_validation-record" {
  zone_id = yandex_dns_zone.huntassessment_ru.id
  name    = yandex_cm_certificate.huntassessment.challenges[0].dns_name
  type    = yandex_cm_certificate.huntassessment.challenges[0].dns_type
  ttl     = 300
  data    = [yandex_cm_certificate.huntassessment.challenges[0].dns_value]
}
