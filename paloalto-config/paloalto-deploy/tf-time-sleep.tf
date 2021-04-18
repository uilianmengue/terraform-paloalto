resource "time_sleep" "wait_paloalto" {
  depends_on = [aws_instance.fw_01]
  create_duration = "900s"
}

resource "null_resource" "next" {
  provisioner "local-exec" {
    command = "panos_init /Users/uilian/BLU/keys/AWS_personal.pem"
    environment = {
      PANOS_HOSTNAME = aws_eip.management_eip.public_ip
      PANOS_USERNAME = "uilian.mengue"
      PANOS_PASSWORD = "Hya567#2Jhs"
    }
  }
  depends_on = [time_sleep.wait_paloalto]
}
