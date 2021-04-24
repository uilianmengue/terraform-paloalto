resource "time_sleep" "wait_paloalto_commit" {
  depends_on = [panos_security_rule_group.db_security_policy]
  create_duration = "10s"
}


resource "null_resource" "next_commit" {
  provisioner "local-exec" {
    command = "firewall-commit 'Commit changes'"
    environment = {
      PANOS_HOSTNAME = var.hostname
      PANOS_USERNAME = "uilian.mengue"
      PANOS_PASSWORD = "Hya567#2Jhs"
    }
  }
  depends_on = [time_sleep.wait_paloalto_commit]
}