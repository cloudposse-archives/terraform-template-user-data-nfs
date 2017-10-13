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

variable "os" {
  default     = "ubuntu"
  description = "Server OS that will execute user data script"
}
