resource "datadog_synthetics_test" "api_test" {
  type = "api"

  request = {
    method = "GET"
    url    = "https://${var.api_test_url}"
  }

  assertions = [
    {
      type     = "statusCode"
      operator = "is"
      target   = "200"
    },
    {
      type     = "header"
      property = "content-type"
      operator = "is"
      target   = "application/json"
    },
    {
      type     = "responseTime"
      operator = "lessThan"
      target   = "2000"
    },
  ]

  locations = ["aws:ap-northeast-1"]

  options = {
    tick_every = 60
  }

  name    = "An API test on ${var.api_test_url}"
  message = "Test on ${var.api_test_url} @${var.slack_channel_name}"

  tags   = []
  status = "live"
}
