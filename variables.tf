variable "vpc_name" {
  type    = string
  default = "terraform-network"
}

variable "vm_name" {
  type    = string
  default = "terraform-instance"
}


variable "existing_vpc_name" {
  type    = string
  default = "vpc-sample1"
  #default = "default"
}
