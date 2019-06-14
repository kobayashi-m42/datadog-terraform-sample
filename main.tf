module "dashboard" {
  source = "./dashboard"
}

module "monitor" {
  source             = "./monitor"
  slack_channel_name = "${var.slack_channel_name}"
}

module "synthetic" {
  source             = "./synthetic"
  slack_channel_name = "${var.slack_channel_name}"
  api_test_url       = "${var.api_test_url}"
}
