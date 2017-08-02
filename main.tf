resource "null_resource" "default" {
  triggers = {
    id = "${lower(format("%v-%v-%v", var.namespace, var.stage, var.name))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "default" {
  template = "${file("${path.module}/user_data.sh")}"

  vars {
    dir       = "${var.dir}"
    host       = "${var.host}"
  }
}
