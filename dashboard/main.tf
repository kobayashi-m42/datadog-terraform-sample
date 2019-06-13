resource "datadog_timeboard" "fargate" {
  title       = "Fargate created by Terraform"
  description = "Fargate created by Terraform"
  read_only   = true

  graph {
    title = "CPU Percent"
    viz   = "timeseries"

    request {
      q    = "avg:ecs.fargate.cpu.percent{ecs_container_name:php}"
      type = "lines"
    }

    request {
      q    = "avg:ecs.fargate.cpu.percent{ecs_container_name:nginx}"
      type = "lines"
    }
  }

  graph {
    title = "Memory Usage"
    viz   = "timeseries"

    request {
      q    = "avg:ecs.fargate.mem.usage{ecs_container_name:php}"
      type = "lines"
    }

    request {
      q    = "avg:ecs.fargate.mem.usage{ecs_container_name:nginx}"
      type = "lines"
    }
  }
}
