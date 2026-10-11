output "environments_id" {
  description = "Map of id values across all environments, keyed the same as var.environments except keys with no id are omitted"
  value       = { for k, v in azuredevops_environment.environments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "environments_description" {
  description = "Map of description values across all environments, keyed the same as var.environments except keys with no description are omitted"
  value       = { for k, v in azuredevops_environment.environments : k => v.description if v.description != null && length(v.description) > 0 }
}
output "environments_name" {
  description = "Map of name values across all environments, keyed the same as var.environments except keys with no name are omitted"
  value       = { for k, v in azuredevops_environment.environments : k => v.name if v.name != null && length(v.name) > 0 }
}
output "environments_project_id" {
  description = "Map of project_id values across all environments, keyed the same as var.environments except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_environment.environments : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}

