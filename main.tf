data "aws_caller_identity" "current" {
    count = local.create ? 1 : 0
}

variable "create" {
  type = bool
  default = true
}
locals {
    create = var.create
    account_id = try(data.aws_caller_identity.current[0].account_id, "")
}

variable "secrity_grp" {
  type = map(object({
    cidr_ipv4 = test
    cidr_ipv6 = fs
  }))
}

resource "aws_instance" "myec2" {
    count = local.create ? 1 : 0
    region =  
    ami =
    key_name = 
    vpc_security_group_ids = 
    subnet_id = 
    instance_type =  
    host_id = 
    dynamic "secrity_grp" {
        for_each =  var.secrity_grp   

        content {
            cidr_ipv4 = each.value.cidr_ipv4
        }
    }
}