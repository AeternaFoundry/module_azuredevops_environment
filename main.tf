resource "azuredevops_environment" "environments" {
  for_each = var.environments

  name        = each.value.name
  project_id  = each.value.project_id
  description = each.value.description

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

