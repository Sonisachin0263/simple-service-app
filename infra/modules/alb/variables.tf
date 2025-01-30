variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
}