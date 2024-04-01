################################################################################
# Service
################################################################################

output "id" {
  description = "ARN that identifies the service"
  value       = try(module.ecs_service[0].id, null)
}

output "name" {
  description = "Name of the service"
  value       = try(module.ecs_service[0].name, null)
}

################################################################################
# IAM Role
################################################################################

output "iam_role_name" {
  description = "Service IAM role name"
  value       = try(module.ecs_service[0].iam_role_name, null)
}

output "iam_role_arn" {
  description = "Service IAM role ARN"
  value       = try(module.ecs_service[0].iam_role_arn, null)
}

output "iam_role_unique_id" {
  description = "Stable and unique string identifying the service IAM role"
  value       = try(module.ecs_service[0].iam_role_unique_id, null)
}

################################################################################
# Container Definition
################################################################################

output "container_definitions" {
  description = "Container definitions"
  value       = try(module.ecs_service[0].container_definitions, null)
}

################################################################################
# Task Definition
################################################################################

output "task_definition_arn" {
  description = "Full ARN of the Task Definition (including both `family` and `revision`)"
  value       = try(module.ecs_service[0].task_definition_arn, null)
}

output "task_definition_revision" {
  description = "Revision of the task in a particular family"
  value       = try(module.ecs_service[0].task_definition_revision, null)
}

output "task_definition_family" {
  description = "The unique name of the task definition"
  value       = try(module.ecs_service[0].task_definition_family, null)
}

################################################################################
# Task Execution - IAM Role
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html
################################################################################

output "task_exec_iam_role_name" {
  description = "Task execution IAM role name"
  value       = try(module.ecs_service[0].task_exec_iam_role_name, null)
}

output "task_exec_iam_role_arn" {
  description = "Task execution IAM role ARN"
  value       = try(module.ecs_service[0].task_exec_iam_role_arn, null)
}

output "task_exec_iam_role_unique_id" {
  description = "Stable and unique string identifying the task execution IAM role"
  value       = try(module.ecs_service[0].task_exec_iam_role_unique_id, null)
}

################################################################################
# Tasks - IAM role
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html
################################################################################

output "tasks_iam_role_name" {
  description = "Tasks IAM role name"
  value       = try(module.ecs_service[0].tasks_iam_role_name, null)
}

output "tasks_iam_role_arn" {
  description = "Tasks IAM role ARN"
  value       = try(module.ecs_service[0].tasks_iam_role_arn, null)
}

output "tasks_iam_role_unique_id" {
  description = "Stable and unique string identifying the tasks IAM role"
  value       = try(module.ecs_service[0].tasks_iam_role_unique_id, null)
}

################################################################################
# Task Set
################################################################################

output "task_set_id" {
  description = "The ID of the task set"
  value       = try(module.ecs_service[0].task_set_id, null)
}

output "task_set_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the task set"
  value       = try(module.ecs_service[0].task_set_arn, null)
}

output "task_set_stability_status" {
  description = "The stability status. This indicates whether the task set has reached a steady state"
  value       = try(module.ecs_service[0].task_set_stability_status, null)
}

output "task_set_status" {
  description = "The status of the task set"
  value       = try(module.ecs_service[0].task_set_status, null)
}

################################################################################
# Autoscaling
################################################################################

output "autoscaling_policies" {
  description = "Map of autoscaling policies and their attributes"
  value       = try(module.ecs_service[0].autoscaling_policies, null)
}

output "autoscaling_scheduled_actions" {
  description = "Map of autoscaling scheduled actions and their attributes"
  value       = try(module.ecs_service[0].autoscaling_scheduled_actions, null)
}

################################################################################
# Security Group
################################################################################

output "security_group_arn" {
  description = "Amazon Resource Name (ARN) of the security group"
  value       = try(module.ecs_service[0].security_group_arn, null)
}

output "security_group_id" {
  description = "ID of the security group"
  value       = try(module.ecs_service[0].security_group_id, null)
}

################################################################################
# Metric Alert
################################################################################
output "cloudwatch_metric_alarm_1_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = try(module.metric_alerm_1[0].cloudwatch_metric_alarm_arn, "")
}

output "cloudwatch_metric_alarm_1_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = try(module.metric_alerm_1[0].cloudwatch_metric_alarm_id, "")
}


################################################################################
# Metric Alert
################################################################################
output "cloudwatch_metric_alarm_2_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = try(module.metric_alerm_2[0].cloudwatch_metric_alarm_arn, "")
}

output "cloudwatch_metric_alarm_2_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = try(module.metric_alerm_1[0].cloudwatch_metric_alarm_id, "")
}
