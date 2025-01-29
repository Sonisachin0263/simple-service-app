module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  name = "app-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.pvt_sub_cidr
  public_subnets  = var.pub_sub_cidr

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    for index, az in var.azs : var.pub_sub_cidr[index] => "public-subnet-${index}"
  }

  private_subnet_tags = {
    for index, az in var.azs : var.pvt_sub_cidr[index] => "private-subnet-${index}"
  }

  tags = {
    Name = "app-vpc"
  }

  public_route_table_tags = {
    Name    = "app-public-rt"
  }
  private_route_table_tags = {
    Name    = "app-private-rt"
  }
}