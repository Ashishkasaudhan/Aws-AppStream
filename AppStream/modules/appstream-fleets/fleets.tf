resource "aws_appstream_fleet" "appstream_fleet" {
  name = var.fleet_name

  compute_capacity {
    desired_instances = var.desired_capacity
  }

  description                        = "appstream fleet for ${var.fleet_name}"
  display_name                       = var.fleet_name
  enable_default_internet_access     = false
  fleet_type                         = var.fleet_type
  image_name                         = var.image_name
  instance_type                      = var.instance_type
  max_user_duration_in_seconds       = 30000
  disconnect_timeout_in_seconds      = 900
  idle_disconnect_timeout_in_seconds = 900
  stream_view                        = "DESKTOP"

  vpc_config {
    subnet_ids = tolist(data.aws_subnets.private.ids)
  }

  tags = {
    project = "App-Stream"
  }
}

resource "aws_appstream_stack" "appstream_stack" {
  name         = var.stack_name
  description  = "Stack to host appstream ${var.fleet_name} fleets"
  display_name = "App-Stream-poc-${var.fleet_name}"


  user_settings {
    action     = "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
    permission = "ENABLED"
  }

  user_settings {
    action     = "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
    permission = "ENABLED"
  }

  user_settings {
    action     = "DOMAIN_PASSWORD_SIGNIN"
    permission = "ENABLED"
  }

  user_settings {
    action     = "DOMAIN_SMART_CARD_SIGNIN"
    permission = "DISABLED"
  }

  user_settings {
    action     = "PRINTING_TO_LOCAL_DEVICE"
    permission = "ENABLED"
  }

  user_settings {
    action     = "FILE_UPLOAD"
    permission = "ENABLED"
  }
  

  user_settings {
    action     = "FILE_DOWNLOAD"
    permission = "ENABLED"
  }

  tags = {
    project = "App-Stream"
  }
}

resource "null_resource" "anno_associate_fleet_stack" {
  depends_on = [aws_appstream_fleet.appstream_fleet,
                aws_appstream_stack.appstream_stack]

  triggers = {
    appstream_fleet = aws_appstream_fleet.appstream_fleet.id
    appstream_stack = aws_appstream_stack.appstream_stack.id
  }

  provisioner "local-exec" {
    command = "aws appstream associate-fleet --fleet-name ${self.triggers.appstream_fleet} --stack-name ${self.triggers.appstream_stack}"
  }

  provisioner "local-exec" {
    when = destroy
    command = "aws appstream disassociate-fleet --fleet-name ${self.triggers.appstream_fleet} --stack-name ${self.triggers.appstream_stack}"
  }
}