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
    build_pack_group = object({
      build_pack_ids = optional(list(string))
      name           = string
    })
    stack = object({
      id      = string
      version = string
    })
  }))
}

