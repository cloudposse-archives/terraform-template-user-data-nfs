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
  default     = "-"
}

variable "attributes" {
  description = ""
  type        = "list"
  default     = []
}

variable "tags" {
  description = ""
  type        = "map"
  default     = {}
}

variable "dir" {
  description = "Directory mount to"
}

variable "host" {
  description = "NFS server host"
}

variable "flavor" {
  default     = "debian-systemd"
  description = "Flavor depends of OS and init system"
}
