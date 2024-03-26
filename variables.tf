variable "ecs_service" {
  description = "ECS Service variables"
  type = object({
    create                                  = optional(bool, true)
    tags                                    = optional(map(string), {})
    ignore_task_definition_changes          = optional(bool, false)
    alarms                                  = optional(any, {})
    capacity_provider_strategy              = optional(any, {})
    cluster_arn                             = optional(string, "")
    deployment_circuit_breaker              = optional(any, {})
    deployment_controller                   = optional(any, {})
    deployment_maximum_percent              = optional(number, 200)
    deployment_minimum_healthy_percent      = optional(number, 66)
    desired_count                           = optional(number, 1)
    enable_ecs_managed_tags                 = optional(bool, true)
    enable_execute_command                  = optional(bool, true)
    force_new_deployment                    = optional(bool, true)
    health_check_grace_period_seconds       = optional(number, null)
    launch_type                             = optional(string, "FARGATE")
    load_balancer                           = optional(any, {})
    name                                    = optional(string, null)
    assign_public_ip                        = optional(bool, false)
    security_group_ids                      = optional(list(string), [])
    subnet_ids                              = optional(list(string), [])
    ordered_placement_strategy              = optional(any, {})
    placement_constraints                   = optional(any, {})
    platform_version                        = optional(string, null)
    propagate_tags                          = optional(string, null)
    scheduling_strategy                     = optional(string, null)
    service_connect_configuration           = optional(any, {})
    service_registries                      = optional(any, {})
    timeouts                                = optional(map(string), {})
    triggers                                = optional(any, {})
    wait_for_steady_state                   = optional(bool, null)
    service_tags                            = optional(map(string), {})
    create_iam_role                         = optional(bool, true)
    iam_role_arn                            = optional(string, null)
    iam_role_name                           = optional(string, null)
    iam_role_use_name_prefix                = optional(bool, true)
    iam_role_path                           = optional(string, null)
    iam_role_description                    = optional(string, null)
    iam_role_permissions_boundary           = optional(string, null)
    iam_role_tags                           = optional(map(string), {})
    iam_role_statements                     = optional(any, {})
    create_task_definition                  = optional(bool, true)
    task_definition_arn                     = optional(string, null)
    container_definitions                   = optional(any, {})
    container_definition_defaults           = optional(any, {})
    cpu                                     = optional(number, 1024)
    ephemeral_storage                       = optional(any, {})
    family                                  = optional(string, null)
    inference_accelerator                   = optional(any, {})
    ipc_mode                                = optional(string, null)
    memory                                  = optional(number, 2048)
    network_mode                            = optional(string, "awsvpc")
    pid_mode                                = optional(string, null)
    task_definition_placement_constraints   = optional(any, {})
    proxy_configuration                     = optional(any, {})
    requires_compatibilities                = optional(list(string), ["FARGATE"])
    runtime_platform                        = optional(any, {})
    skip_destroy                            = optional(bool, null)
    volume                                  = optional(any, {})
    task_tags                               = optional(map(string), {})
    create_task_exec_iam_role               = optional(bool, true)
    task_exec_iam_role_arn                  = optional(string, null)
    task_exec_iam_role_name                 = optional(string, null)
    task_exec_iam_role_use_name_prefix      = optional(bool, true)
    task_exec_iam_role_path                 = optional(string, null)
    task_exec_iam_role_description          = optional(string, null)
    task_exec_iam_role_permissions_boundary = optional(string, null)
    task_exec_iam_role_tags                 = optional(map(string), {})
    task_exec_iam_role_policies             = optional(map(string), {})
    create_task_exec_policy                 = optional(bool, true)
    task_exec_ssm_param_arns                = optional(list(string), ["arn:aws:ssm:*:*:parameter/*"])
    task_exec_secret_arns                   = optional(list(string), ["arn:aws:secretsmanager:*:*:secret:*"])
    task_exec_iam_statements                = optional(any, {})
    create_tasks_iam_role                   = optional(bool, true)
    tasks_iam_role_arn                      = optional(string, null)
    tasks_iam_role_name                     = optional(string, null)
    tasks_iam_role_use_name_prefix          = optional(bool, true)
    tasks_iam_role_path                     = optional(string, null)
    tasks_iam_role_description              = optional(string, null)
    tasks_iam_role_permissions_boundary     = optional(string, null)
    tasks_iam_role_tags                     = optional(map(string), {})
    tasks_iam_role_policies                 = optional(map(string), {})
    tasks_iam_role_statements               = optional(any, {})
    external_id                             = optional(string, null)
    scale                                   = optional(any, {})
    force_delete                            = optional(bool, null)
    wait_until_stable                       = optional(bool, null)
    wait_until_stable_timeout               = optional(string, null)
    enable_autoscaling                      = optional(bool, true)
    autoscaling_min_capacity                = optional(number, 1)
    autoscaling_max_capacity                = optional(number, 10)
    autoscaling_policies = optional(any, {
      cpu = {
        policy_type = "TargetTrackingScaling"

        target_tracking_scaling_policy_configuration = {
          predefined_metric_specification = {
            predefined_metric_type = "ECSServiceAverageCPUUtilization"
          }
        }
      }
      memory = {
        policy_type = "TargetTrackingScaling"

        target_tracking_scaling_policy_configuration = {
          predefined_metric_specification = {
            predefined_metric_type = "ECSServiceAverageMemoryUtilization"
          }
        }
      }
    })
    autoscaling_scheduled_actions  = optional(any, {})
    create_security_group          = optional(bool, true)
    security_group_name            = optional(string, null)
    security_group_use_name_prefix = optional(bool, true)
    security_group_description     = optional(string, null)
    security_group_rules           = optional(any, {})
    security_group_tags            = optional(map(string), {})
  })
}



variable "metric_alarm" {
  description = "Metric-alarm resource"
  type = object({
    create_metric_alarm                   = optional(bool, true)
    alarm_name                            = optional(string, "default")
    alarm_description                     = optional(string, null)
    comparison_operator                   = optional(string, "GreaterThanOrEqualToThreshold")
    evaluation_periods                    = optional(number, 1)
    threshold                             = optional(number, null)
    threshold_metric_id                   = optional(string, null)
    unit                                  = optional(string, null)
    metric_name                           = optional(string, null)
    namespace                             = optional(string, null)
    period                                = optional(string, null)
    statistic                             = optional(string, null)
    actions_enabled                       = optional(bool, true)
    datapoints_to_alarm                   = optional(number, null)
    dimensions                            = optional(any, null)
    alarm_actions                         = optional(list(string), null)
    insufficient_data_actions             = optional(list(string), null)
    ok_actions                            = optional(list(string), null)
    extended_statistic                    = optional(string, null)
    treat_missing_data                    = optional(string, "missing")
    evaluate_low_sample_count_percentiles = optional(string, null)
    metric_query                          = optional(any, [])
    tags                                  = optional(map(string), {})

    autoscaling_policies_id = optional(string, "sqs")
  })
}
