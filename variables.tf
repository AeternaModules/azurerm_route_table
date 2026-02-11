variable "route_tables" {
  description = <<EOT
Map of route_tables, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - bgp_route_propagation_enabled
    - tags
    - route (block):
        - address_prefix (required)
        - name (required)
        - next_hop_in_ip_address (optional)
        - next_hop_type (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    bgp_route_propagation_enabled = optional(bool) # Default: true
    tags                          = optional(map(string))
    route = optional(object({
      address_prefix         = string
      name                   = string
      next_hop_in_ip_address = optional(string)
      next_hop_type          = string
    }))
  }))
}

