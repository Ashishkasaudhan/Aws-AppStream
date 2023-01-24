resource "aws_appautoscaling_target" "appstream_instances" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "fleet/${aws_appstream_fleet.appstream_fleet.id}"
  scalable_dimension = "appstream:fleet:DesiredCapacity"
  service_namespace  = "appstream"
}

resource "aws_appautoscaling_policy" "appstream_policy_out" {
  name               = "${var.fleet_name} scale-out "
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.appstream_instances.resource_id
  scalable_dimension = aws_appautoscaling_target.appstream_instances.scalable_dimension
  service_namespace  = aws_appautoscaling_target.appstream_instances.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "PercentChangeInCapacity"
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 25
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "app_scale_out" {
  alarm_name          = "${var.fleet_name} appstream_scale_out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CapacityUtilization"
  namespace           = "AWS/AppStream"
  period              = "120"
  statistic           = "Average"
  threshold           = "75"
  unit                = "Percent"
  alarm_description   = "Alarm when Capacity Utilization exceeds 75 percent"
  alarm_actions       = [aws_appautoscaling_policy.appstream_policy_out.arn]
  dimensions = {
    Name  = "Fleet"
    Value = aws_appstream_fleet.appstream_fleet.id
  }
}


resource "aws_appautoscaling_policy" "appstream_policy_in" {
  name               = "${var.fleet_name} scale-in"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.appstream_instances.resource_id
  scalable_dimension = aws_appautoscaling_target.appstream_instances.scalable_dimension
  service_namespace  = aws_appautoscaling_target.appstream_instances.service_namespace

  step_scaling_policy_configuration {
    adjustment_type = "PercentChangeInCapacity"
    cooldown = "300"
    #metric_aggregation_type = "Minimum"
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -25
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "app_scale_in" {
  alarm_name          = "${var.fleet_name} appstream_scale_in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "10"
  metric_name         = "CapacityUtilization"
  namespace           = "AWS/AppStream"
  period              = "120"
  statistic           = "Average"
  threshold           = "40"
  unit                = "Percent"
  alarm_description   = "Alarm when Capacity Utilization is less than or equal to 40 percent"
  alarm_actions       = [aws_appautoscaling_policy.appstream_policy_in.arn]
  dimensions = {
    Name  = "Fleet"
    Value = aws_appstream_fleet.appstream_fleet.id
  }
}