variable "ENV" {}
variable "instance-type"{ default = "t2.micro" }
variable "public-subnets" {type = list(string)}
variable "vpc-id" {}
variable "path_to_public_key"{
  default = "./ssh/aws.pub"
}