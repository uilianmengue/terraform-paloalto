resource "panos_nat_rule_group" "db_connect_nat" {
    rule {
        name = "db_connect_nat"
        original_packet {
            source_zones = [panos_zone.wan_zone.name]
            destination_zone = panos_zone.lan_zone.name
            destination_interface = panos_ethernet_interface.e1.name
            source_addresses = [panos_address_object.ext_ip_origem.name]
            destination_addresses = [panos_address_object.db_adr_object.name]
        }
        translated_packet {
            source {}
            destination {}
        }
    }
}