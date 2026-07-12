output "spring_cloud_builders_id" {
  description = "Map of id values across all spring_cloud_builders, keyed the same as var.spring_cloud_builders"
  value       = { for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : k => v.id }
}
output "spring_cloud_builders_build_pack_group" {
  description = "Map of build_pack_group values across all spring_cloud_builders, keyed the same as var.spring_cloud_builders"
  value       = { for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : k => v.build_pack_group }
}
output "spring_cloud_builders_name" {
  description = "Map of name values across all spring_cloud_builders, keyed the same as var.spring_cloud_builders"
  value       = { for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : k => v.name }
}
output "spring_cloud_builders_spring_cloud_service_id" {
  description = "Map of spring_cloud_service_id values across all spring_cloud_builders, keyed the same as var.spring_cloud_builders"
  value       = { for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : k => v.spring_cloud_service_id }
}
output "spring_cloud_builders_stack" {
  description = "Map of stack values across all spring_cloud_builders, keyed the same as var.spring_cloud_builders"
  value       = { for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : k => v.stack }
}

