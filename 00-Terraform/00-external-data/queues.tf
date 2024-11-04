locals {
  queues = csvdecode(file("${path.module}/countries.csv"))
  codes = ["Sales", "Support", "Customer Service"]
  prefix = "ARA"
  suffix = "DEV"
}

data "genesyscloud_auth_division" "aadivision" {
  name = "AA (Andrew Appleton)"
}

resource "genesyscloud_routing_wrapupcode" "wrapupcodes" {
  for_each = toset(local.codes)
    name = format("%s_%s",local.prefix,each.value)
}

resource "genesyscloud_routing_queue" "queues" {
  for_each = tomap({ for queue in local.queues : queue.country => queue })
  division_id = data.genesyscloud_auth_division.aadivision.id
  name = format("%s_Q_%s_%s",local.prefix,each.value.code,local.suffix)
  description = format("Queue for %s calls", each.value.country)
  acw_timeout_ms = each.value.acw_timeout_ms
  auto_answer_only = each.value.auto_answer_only
  enable_transcription = each.value.enable_transcription
  calling_party_name = format("%s Corp., %s",local.prefix,each.value.country)
  wrapup_codes = [
    for code in genesyscloud_routing_wrapupcode.wrapupcodes:
      code.id
  ]
}

