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

## IAM Role Policy that allows access to S3
resource "aws_iam_policy" "default" {
  name = "${null_resource.default.triggers.id}"

  lifecycle {
    create_before_destroy = true
  }

  policy = "${data.aws_iam_policy_document.default.json}"
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ec2:DescribeInstances",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]
  }
}