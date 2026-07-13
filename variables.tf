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
  # --- Unconfirmed validation candidates, derived from azurerm_spring_cloud_builder's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: spring_cloud_service_id
  #   source:    [from validate.SpringCloudServiceID] !ok
  # path: spring_cloud_service_id
  #   source:    [from validate.SpringCloudServiceID] err != nil
  # path: build_pack_group.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: build_pack_group.build_pack_ids[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: stack.id
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: stack.version
  #   condition: length(value) > 0
  #   message:   must not be empty
}

