output "user_data" {
  description = "A rendered content of the shell script"
  value = "${data.template_file.default.rendered}"
}
