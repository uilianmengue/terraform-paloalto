provider "panos" {
    hostname =  "${modules.aws_eip.management_eip.public_ip}"
    username = "uilian.mengue"
    password = "Hya567#2Jhs"
    timeout =  10
    logging =  ["action", "op", "uid"]
    verify_certificate = false
}


module "paloalto-deploy" {
    source = "./paloalto-deploy/"
}