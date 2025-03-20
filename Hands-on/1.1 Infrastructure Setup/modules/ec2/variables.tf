variable "vpc_id" {}
variable "public_subnet_id" {}
variable "instance_type" {}
variable "tags" {
  type    = map(string)
  default = {}
}
