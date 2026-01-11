resource "azurerm_spring_cloud_builder" "spring_cloud_builders" {
  for_each = var.spring_cloud_builders

  name                    = each.value.name
  spring_cloud_service_id = each.value.spring_cloud_service_id

  build_pack_group {
    build_pack_ids = each.value.build_pack_group.build_pack_ids
    name           = each.value.build_pack_group.name
  }

  stack {
    id      = each.value.stack.id
    version = each.value.stack.version
  }
}

