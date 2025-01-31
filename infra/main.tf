module "vpc" {
  source            = "./modules/vpc"
  vpc_name          = var.vpc_name
  vpc_cidr          = var.vpc_cidr
  azs               = var.azs
  pvt_sub_cidr      = var.pvt_sub_cidr
  pub_sub_cidr      = var.pub_sub_cidr
}

module "alb" {
  source = "./modules/alb"

  alb_name          = var.alb_name
  container_port    = var.container_port
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}

module "ecs" {
  source = "./modules/ecs"

  cluster_name          = var.cluster_name
  service_name          = var.service_name
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnets
  container_image       = var.container_image
  container_port        = var.container_port
  target_group_arn      = module.alb.target_group_arn
  alb_security_group_id = module.alb.alb_security_group_id
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the load balancer"
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.app_td.arn
}
