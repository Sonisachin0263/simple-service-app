module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.pvt_sub_cidr
  public_subnets  = var.pub_sub_cidr

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "app-subnet-public"
  }

  private_subnet_tags = {
    Name = "app-subnet-private"
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

  nat_gateway_tags = {
    Name = "app-nat-gw"
  }
}
