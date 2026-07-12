resource "azurerm_route_table" "route_tables" {
  for_each = var.route_tables

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled
  tags                          = each.value.tags

  dynamic "route" {
    for_each = each.value.route != null ? each.value.route : []
    content {
      address_prefix         = route.value.address_prefix
      name                   = route.value.name
      next_hop_in_ip_address = route.value.next_hop_in_ip_address
      next_hop_type          = route.value.next_hop_type
    }
  }
}

