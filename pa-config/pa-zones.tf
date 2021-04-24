resource "panos_zone" "lan_zone" {
    name = "lan"
    mode = "layer3"
    interfaces = [
        panos_ethernet_interface.e1.name,
    ]
    enable_user_id = true
    exclude_acls = ["192.168.0.0/16"]
}
resource "panos_zone" "wan_zone" {
    name = "wan"
    mode = "layer3"
    interfaces = [
        panos_ethernet_interface.e2.name
    ]
    enable_user_id = true
    exclude_acls = ["192.168.0.0/16"]
}