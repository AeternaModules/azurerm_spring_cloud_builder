variable "spring_cloud_builders" {
  description = <<EOT
Map of spring_cloud_builders, attributes below
Required:
    - name
    - spring_cloud_service_id
    - build_pack_group (block):
        - build_pack_ids (optional)
        - name (required)
    - stack (block):
        - id (required)
        - version (required)
EOT

  type = map(object({
    name                    = string
    spring_cloud_service_id = string
    build_pack_group = list(object({
      build_pack_ids = optional(list(string))
      name           = string
    }))
    stack = object({
      id      = string
      version = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_builders : (
        length(v.build_pack_group) >= 1
      )
    ])
    error_message = "Each build_pack_group list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_builders : (
        alltrue([for item in v.build_pack_group : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_builders : (
        alltrue([for item in v.build_pack_group : (item.build_pack_ids == null || (alltrue([for x in item.build_pack_ids : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_builders : (
        length(v.stack.id) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.spring_cloud_builders : (
        length(v.stack.version) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

