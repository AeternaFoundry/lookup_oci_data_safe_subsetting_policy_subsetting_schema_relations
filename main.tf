data "oci_data_safe_subsetting_policy_subsetting_schema_relations" "data_safe_subsetting_policy_subsetting_schema_relations_lookup" {
  for_each = var.data_safe_subsetting_policy_subsetting_schema_relations_lookup

  subsetting_policy_id = each.value.subsetting_policy_id
  object               = each.value.object
  relation_type        = each.value.relation_type
  schema_name          = each.value.schema_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

