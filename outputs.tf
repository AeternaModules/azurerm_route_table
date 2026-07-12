output "route_tables_bgp_route_propagation_enabled" {
  description = "Map of bgp_route_propagation_enabled values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.bgp_route_propagation_enabled }
}
output "route_tables_location" {
  description = "Map of location values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.location }
}
output "route_tables_name" {
  description = "Map of name values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.name }
}
output "route_tables_resource_group_name" {
  description = "Map of resource_group_name values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.resource_group_name }
}
output "route_tables_route" {
  description = "Map of route values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.route }
}
output "route_tables_subnets" {
  description = "Map of subnets values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.subnets }
}
output "route_tables_tags" {
  description = "Map of tags values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.tags }
}

