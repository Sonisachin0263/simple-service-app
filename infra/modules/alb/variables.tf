variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}