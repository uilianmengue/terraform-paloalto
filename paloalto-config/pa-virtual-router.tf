resource "panos_virtual_router" "pa_vr" {
    name = "pa_vr"
    static_dist = 15
    interfaces = [
        panos_ethernet_interface.e1.name,
        panos_ethernet_interface.e2.name,
    ]
}