resource "panos_ethernet_interface" "e1" {
    name = "ethernet1/1"
    vsys = "vsys1"
    mode = "layer3"
    static_ips = ["10.1.1.1/24"]
    comment = "Configured for internal traffic"
}
resource "panos_ethernet_interface" "e2" {
    name = "ethernet1/2"
    vsys = "vsys1"
    mode = "layer3"
    static_ips = ["172.10.0.1/24"]
    comment = "Configured for external traffic"
}