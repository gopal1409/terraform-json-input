variable "business_devision" {
  description = "Business devision name"
  type        = string #list of string map numeric
  default     = "sap"
}

variable "environment" {
  type    = string
  default = "project"
}
##to defaine a varaible we define varaiuble and the name of the varaible
variable "resource_group_name" {
  type    = string
  default = "rg-default"
}

#rg-default-sap-dev


variable "resource_group_location" {
  type    = string
  default = "eastus2"
}