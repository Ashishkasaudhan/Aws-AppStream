# List of ports required for Active Directory domain join objects as outlined in:
#https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772723(v=ws.10)?redirectedfrom=MSDN

locals {
  dcports = {
    ldap-udp = {
      description = "UDP LDAP"
      from_port   = 389
      to_port     = 389
      protocol    = "udp"
    },
    ldap-tcp = {
      description = "TCP LDAP"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
    },
    ldaps-tcp = {
      description = "TCP LDAPS"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
    },
    gc-tcp = {
      description = "TCP Global Catalog"
      from_port   = 3268
      to_port     = 3269
      protocol    = "tcp"
    },
    kerberos-udp = {
      description = "UDP Kerberos"
      from_port   = 88
      to_port     = 88
      protocol    = "udp"
    },
    kerberos-tcp = {
      description = "TCP Kerberos"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
    },
    dns-udp = {
      description = "UDP DNS"
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
    },
    dns-tcp = {
      description = "TCP DNS"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },
    smb-tcp = {
      description = "TCP SMB"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
    },
    smb-udp = {
      description = "UDP SMB"
      from_port   = 445
      to_port     = 445
      protocol    = "udp"
    },
    smtp-tcp = {
      description = "TCP SMTP"
      from_port   = 25
      to_port     = 25
      protocol    = "tcp"
    },
    rpc-tcp = {
      description = "TCP RPC"
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
    },
    dfsr-tcp = {
      description = "TCP DFSR"
      from_port   = 5722
      to_port     = 5722
      protocol    = "tcp"
    },
    ntp-udp = {
      description = "UDP NTP"
      from_port   = 123
      to_port     = 123
      protocol    = "udp"
    },
    kerberospwch-udp = {
      description = "UDP Kerberos Password Change"
      from_port   = 464
      to_port     = 464
      protocol    = "udp"
    },
    kerberospwch-tcp = {
      description = "TCP Kerberos Password Change"
      from_port   = 464
      to_port     = 464
      protocol    = "tcp"
    },
    dfs-udp = {
      description = "UDP DFS"
      from_port   = 138
      to_port     = 138
      protocol    = "udp"
    },
    adws-tcp = {
      description = "TCP AD Web Services"
      from_port   = 9389
      to_port     = 9389
      protocol    = "tcp"
    },
    dhcp-udp = {
      description = "UDP DHCP"
      from_port   = 67
      to_port     = 67
      protocol    = "udp"
    },
    dhcp-udp = {
      description = "UDP DHCP"
      from_port   = 2535
      to_port     = 2535
      protocol    = "udp"
    },
    bios-udp = {
      description = "UDP BIOS"
      from_port   = 137
      to_port     = 137
      protocol    = "udp"
    },
    dfsn-tcp = {
      description = "TCP DFSN"
      from_port   = 139
      to_port     = 139
      protocol    = "tcp"
    },
    dynamic-rpc = {
      description = "TCP DYNAMIC"
      from_port   = 1024
      to_port     = 65535
      protocol    = "tcp"
    },
    ephemeral-tcp = {
      description = "TCP Ephemeral Ports"
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
    }
  }
}

resource "aws_security_group" "appstream" {
  name        = "ImageBuilder_AppStream_SG"
  description = "ImageBuilder AppStream Security Group "
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Project = "Nebula"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_security_group_rule" "appstream_ingress" {
  for_each          = local.dcports
  description       = "ingress ${each.value.description}"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = formatlist("%s/21", var.ad_ip_address)
  type              = "ingress"
  security_group_id = aws_security_group.appstream.id
}