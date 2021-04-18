resource "time_sleep" "wait_paloalto" {
  depends_on = [panos_security_rule_group.db_security_policy]
  create_duration = "5s"
}

resource "null_resource" "next" {
  provisioner "local-exec" {
    command = "firewall-commit 'Teste Commit'"
    environment = {
      PANOS_HOSTNAME = "34.226.235.54"
      PANOS_USERNAME = "uilian.mengue"
      PANOS_PASSWORD = "Hya567#2Jhs"
    }
  }
  depends_on = [time_sleep.wait_paloalto]
}
