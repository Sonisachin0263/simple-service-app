output "task_definition_arn" {
  value = aws_ecs_task_definition.app_td.arn
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_tasks.id
}