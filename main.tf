# Define composite variables for resources
module "label" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.1.0"
  namespace = "${var.namespace}"
  name      = "${var.name}"
  stage     = "${var.stage}"
}

data "template_file" "default" {
  template = "${file("${path.module}/user_data.sh")}"

  vars {
    dir       = "${var.dir}"
    host       = "${var.host}"
  }
}
