resource "panos_address_object" "db_adr_object" {
    name = "MyDatabase"
    value = "rds-23434234.us-east1.amazon.com"
    type= "fqdn"
    description = "Database App XYZ"
}
resource "panos_address_object" "ext_ip_origem" {
    name = "Client XYZ"
    value = "172.100.10.70"
    type= "ip-netmask"
    description = "Origin IP client XYZ"
}