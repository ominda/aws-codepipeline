variable "v_aws_region" {
  type = string
  default = "ap-southeast-1"
}

variable "v_default_tags" {
    type = map(string)  
}

variable "v_primary_cidr_block" {
  type = string  
}