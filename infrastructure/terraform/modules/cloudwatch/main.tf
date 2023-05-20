variable "instance_ids" {
  type    = list(string)
  default = []
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  count               = length(var.instance_ids)
  alarm_name          = "high-cpu-${var.instance_ids[count.index]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric checks if CPU utilization is more than 70% for 5 minutes"
  alarm_actions       = [aws_sns_topic.cpu_alarms.arn]
  dimensions = {
    InstanceId = var.instance_ids[count.index]
  }
}

resource "aws_sns_topic" "cpu_alarms" {
  name = "cpu-alarms"
}
