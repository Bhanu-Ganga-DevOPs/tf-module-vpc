resource "aws_subnet" "subnets" {
  count = length(var.cidr_block)
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block[count.index]
  availability_zone = ""
  tags = merge(var.tags,{ Name = "${var.env}-${var.name}-subnet-${count.index}"})
}