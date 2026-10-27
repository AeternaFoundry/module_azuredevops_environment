output "environments_id" {
  description = "Map of id values across all environments, keyed the same as var.environments"
  value       = { for k, v in azuredevops_environment.environments : k => v.id }
}
output "environments_description" {
  description = "Map of description values across all environments, keyed the same as var.environments"
  value       = { for k, v in azuredevops_environment.environments : k => v.description }
}
output "environments_name" {
  description = "Map of name values across all environments, keyed the same as var.environments"
  value       = { for k, v in azuredevops_environment.environments : k => v.name }
}
output "environments_project_id" {
  description = "Map of project_id values across all environments, keyed the same as var.environments"
  value       = { for k, v in azuredevops_environment.environments : k => v.project_id }
}

