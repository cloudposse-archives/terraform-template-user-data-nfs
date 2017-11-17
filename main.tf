# Define composite variables for resources
module "label" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.1.0"
  namespace = "${var.namespace}"
  name      = "${var.name}"
  stage     = "${var.stage}"
}

locals {
  template_path = "${path.module}/templates/${var.flavor}.sh"
}

data "template_file" "default" {
  template = "${file(local.template_path)}"

  vars {
    dir  = "${var.dir}"
    host = "${var.host}"
  }
}
