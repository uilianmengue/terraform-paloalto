resource "time_sleep" "wait_paloalto_start" {
  depends_on = [aws_instance.fw_01]
  create_duration = "1100s"
}

resource "null_resource" "next_start" {
  provisioner "local-exec" {
    command = "export PANOS_HOSTNAME=$PANOS_HOSTNAME && export PANOS_USERNAME=$PANOS_USERNAME && export PANOS_PASSWORD=$PANOS_PASSWORD && panos_init /Users/uilian/BLU/keys/AWS_personal.pem"
    environment = {
      PANOS_HOSTNAME = aws_eip.eip-pa-mgm.public_ip
      PANOS_USERNAME = "uilian.mengue"
      PANOS_PASSWORD = "Hya567#2Jhs"
    }
  }
  depends_on = [time_sleep.wait_paloalto_start]
}