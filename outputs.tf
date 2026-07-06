output "route_tables" {
  description = "All route_table resources"
  value       = azurerm_route_table.route_tables
}
output "route_tables_bgp_route_propagation_enabled" {
  description = "List of bgp_route_propagation_enabled values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.bgp_route_propagation_enabled]
}
output "route_tables_location" {
  description = "List of location values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.location]
}
output "route_tables_name" {
  description = "List of name values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.name]
}
output "route_tables_resource_group_name" {
  description = "List of resource_group_name values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.resource_group_name]
}
output "route_tables_route" {
  description = "List of route values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.route]
}
output "route_tables_subnets" {
  description = "List of subnets values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.subnets]
}
output "route_tables_tags" {
  description = "List of tags values across all route_tables"
  value       = [for k, v in azurerm_route_table.route_tables : v.tags]
}

