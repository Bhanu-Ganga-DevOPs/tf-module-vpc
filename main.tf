resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(var.tags,{ Name = "${var.env} - vpc"})
}

module "subnets" {
  source = "./subnets"
  for_each = var.subnets
  vpc_id = aws_vpc.main.id

  cidr_block = each.value["cidr_block"]
  tags = var.tags
  name = each.value["name"]
  env = var.env
  azs = each.value["azs"]
}