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
  # --- Unconfirmed validation candidates, derived from azurerm_route_table's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.RouteTableName] !regexp.MustCompile(`^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,78}[a-zA-Z0-9_]?$`).MatchString(value)
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: route.name
  #   source:    [from validate.RouteName] !regexp.MustCompile(`^[a-zA-Z0-9][a-zA-Z0-9_.-]{0,78}[a-zA-Z0-9_]?$`).MatchString(value)
  # path: route.address_prefix
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: route.next_hop_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: route.next_hop_in_ip_address
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

