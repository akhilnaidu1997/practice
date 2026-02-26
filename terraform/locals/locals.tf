locals {
  common_name = "${var.Project}-${var.env}"
  common_tags = merge(
    var.tags, {
        Name = local.common_name
        }
  )
}