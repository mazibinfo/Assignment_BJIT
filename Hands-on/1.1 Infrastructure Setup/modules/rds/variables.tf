variable "vpc_id" {}
variable "private_subnet_id" {}
variable "ec2_security_group_id" {}
variable "db_username" {}
variable "db_password" {}
variable "tags" {
  type    = map(string)
  default = {}
}
