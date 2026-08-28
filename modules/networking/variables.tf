variable "vpc_id" {
  type        = string
  description = "The vpc id for the network to be created"
}

variable "public_cidr_block" {
  type        = string
  description = "The cidr block for the public subnet"
}
