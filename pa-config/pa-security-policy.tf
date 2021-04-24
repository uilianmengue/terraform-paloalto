resource "panos_security_rule_group" "db_security_policy" {
    #position_keyword = "top"
    #position_reference = "deny everything else"
    rule {
        name = "db_security_policy"
        source_zones = [panos_zone.wan_zone.name]
        source_addresses = ["any"]
        source_users = ["any"]
        hip_profiles = ["any"]
        destination_zones = [panos_zone.lan_zone.name]
        destination_addresses = ["any"]
        applications = ["ssl", "web-browsing"]
        services = ["service-http", "service-https"]
        categories = ["any"]
        action = "allow"
    }
}