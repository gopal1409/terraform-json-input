

variable "web_linux_instance_count" {
  description = "web linux vm instance count"
  type = map(string)
  default = {
   "default" = "1022"
  }
}