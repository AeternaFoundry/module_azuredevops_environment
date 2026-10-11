variable "environments" {
  description = <<EOT
Map of environments, attributes below
Required:
    - name
    - project_id
Optional:
    - description
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    name        = string
    project_id  = string
    description = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.environments : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.project_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.environments : (
        can(regex("^[^,^\"^/^\\\\^\\[^\\]^:^|^<^>^+^=^;^?^*]{0,127}$", v.name))
      )
    ])
    error_message = "[from validate.EnvironmentName: must match ^[^,^\"^/^\\\\^\\[^\\]^:^|^<^>^+^=^;^?^*]{0,127}$]"
  }
}

