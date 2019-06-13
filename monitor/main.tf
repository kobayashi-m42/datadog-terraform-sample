resource "datadog_monitor" "fargate_high_cpu_percent" {
  name               = "High CPU Percent of Docker"
  type               = "metric alert"
  message            = "Fargate High CPU Percent @${var.slack_channel_name}"
  escalation_message = ""

  query = "max(last_1m):avg:ecs.fargate.cpu.percent{*} > 1"

  thresholds {
    critical = 1
  }

  notify_no_data    = false
  renotify_interval = 0

  notify_audit = false
  timeout_h    = 0
  include_tags = true

  require_full_window = false
  new_host_delay      = 300
}
