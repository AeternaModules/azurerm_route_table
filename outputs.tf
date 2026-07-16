output "route_tables_id" {
  description = "Map of id values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "route_tables_bgp_route_propagation_enabled" {
  description = "Map of bgp_route_propagation_enabled values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.bgp_route_propagation_enabled if v.bgp_route_propagation_enabled != null }
}
output "route_tables_location" {
  description = "Map of location values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.location if v.location != null && length(v.location) > 0 }
}
output "route_tables_name" {
  description = "Map of name values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "route_tables_resource_group_name" {
  description = "Map of resource_group_name values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "route_tables_route" {
  description = "Map of route values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.route if v.route != null && length(v.route) > 0 }
}
output "route_tables_subnets" {
  description = "Map of subnets values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.subnets if v.subnets != null && length(v.subnets) > 0 }
}
output "route_tables_tags" {
  description = "Map of tags values across all route_tables, keyed the same as var.route_tables"
  value       = { for k, v in azurerm_route_table.route_tables : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

