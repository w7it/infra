resource "yandex_cm_certificate" "huntassessment" {
  name    = "huntassessment"
  domains = ["huntassessment.ru"]

  managed {
    challenge_type = "DNS_CNAME"
  }
}
