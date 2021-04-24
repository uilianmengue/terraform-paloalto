provider "panos" {
    hostname = var.hostname
    username = "uilian.mengue"
    password = "Hya567#2Jhs"
    timeout =  10
    logging =  ["action", "op", "uid"]
    verify_certificate = false
}