output "spring_cloud_builders" {
  description = "All spring_cloud_builder resources"
  value       = azurerm_spring_cloud_builder.spring_cloud_builders
}
output "spring_cloud_builders_build_pack_group" {
  description = "List of build_pack_group values across all spring_cloud_builders"
  value       = [for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : v.build_pack_group]
}
output "spring_cloud_builders_name" {
  description = "List of name values across all spring_cloud_builders"
  value       = [for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : v.name]
}
output "spring_cloud_builders_spring_cloud_service_id" {
  description = "List of spring_cloud_service_id values across all spring_cloud_builders"
  value       = [for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : v.spring_cloud_service_id]
}
output "spring_cloud_builders_stack" {
  description = "List of stack values across all spring_cloud_builders"
  value       = [for k, v in azurerm_spring_cloud_builder.spring_cloud_builders : v.stack]
}

