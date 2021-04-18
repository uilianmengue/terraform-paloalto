resource "panos_security_policy" "Web2py_Policy" {
    rule {
        name = "VPN_WEB2PY"
        source_zones = ["VPN_GP"]
        source_addresses = ["any"]
        source_users = ["useblu\\vpn_colaboradores"]
        hip_profiles = ["any"]
        destination_zones = var.LAN_ZONE
        destination_addresses = ["172.100.10.70"]
        applications = ["ssl", "web-browsing"]
        services = ["service-http", "service-https"]
        categories = ["any"]
        action = "allow"
        log_setting = "SYSLOG_PROFILE"
        group = "IPS_GROUP_VPN"
    }
}