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
        - address_prefix (optional)
        - name (optional)
        - next_hop_in_ip_address (optional)
        - next_hop_type (optional)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    bgp_route_propagation_enabled = optional(bool)
    tags                          = optional(map(string))
    route = optional(list(object({
      address_prefix         = optional(string)
      name                   = optional(string)
      next_hop_in_ip_address = optional(string)
      next_hop_type          = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.route_tables : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_tables : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_tables : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_tables : (
        v.route == null || alltrue([for item in v.route : (item.address_prefix == null || (length(item.address_prefix) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_tables : (
        v.route == null || alltrue([for item in v.route : (item.next_hop_in_ip_address == null || (length(item.next_hop_in_ip_address) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_tables : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

