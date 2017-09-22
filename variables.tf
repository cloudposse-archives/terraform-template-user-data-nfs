variable "namespace" {
  description = ""
}

variable "stage" {
  description = ""
}

variable "name" {
  description = ""
}

variable "delimiter" {
  description = ""
  default = "-"
}

variable "attributes" {
  description = ""
  type    = "list"
  default = []
}

variable "tags" {
  description = ""
  type    = "map"
  default = {}
}

variable "dir" {
  description = ""
}

variable "host" {
  description = ""
}
