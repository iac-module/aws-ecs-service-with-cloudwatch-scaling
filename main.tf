module "ecs_service" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-ecs.git//modules/service?ref=a35b5c8e0c06dd2785b73e6f810602a66b13bd4f" #v5.10.0"
  count  = var.ecs_service.create ? 1 : 0

  create                                  = var.ecs_service.create
  tags                                    = var.ecs_service.tags
  ignore_task_definition_changes          = var.ecs_service.ignore_task_definition_changes
  alarms                                  = var.ecs_service.alarms
  capacity_provider_strategy              = var.ecs_service.capacity_provider_strategy
  cluster_arn                             = var.ecs_service.cluster_arn
  deployment_circuit_breaker              = var.ecs_service.deployment_circuit_breaker
  deployment_controller                   = var.ecs_service.deployment_controller
  deployment_maximum_percent              = var.ecs_service.deployment_maximum_percent
  deployment_minimum_healthy_percent      = var.ecs_service.deployment_minimum_healthy_percent
  desired_count                           = var.ecs_service.desired_count
  enable_ecs_managed_tags                 = var.ecs_service.enable_ecs_managed_tags
  enable_execute_command                  = var.ecs_service.enable_execute_command
  force_new_deployment                    = var.ecs_service.force_new_deployment
  health_check_grace_period_seconds       = var.ecs_service.health_check_grace_period_seconds
  launch_type                             = var.ecs_service.launch_type
  load_balancer                           = var.ecs_service.load_balancer
  name                                    = var.ecs_service.name
  assign_public_ip                        = var.ecs_service.assign_public_ip
  security_group_ids                      = var.ecs_service.security_group_ids
  subnet_ids                              = var.ecs_service.subnet_ids
  ordered_placement_strategy              = var.ecs_service.ordered_placement_strategy
  placement_constraints                   = var.ecs_service.placement_constraints
  platform_version                        = var.ecs_service.platform_version
  propagate_tags                          = var.ecs_service.propagate_tags
  scheduling_strategy                     = var.ecs_service.scheduling_strategy
  service_connect_configuration           = var.ecs_service.service_connect_configuration
  service_registries                      = var.ecs_service.service_registries
  timeouts                                = var.ecs_service.timeouts
  triggers                                = var.ecs_service.triggers
  wait_for_steady_state                   = var.ecs_service.wait_for_steady_state
  service_tags                            = var.ecs_service.service_tags
  create_iam_role                         = var.ecs_service.create_iam_role
  iam_role_arn                            = var.ecs_service.iam_role_arn
  iam_role_name                           = var.ecs_service.iam_role_name
  iam_role_use_name_prefix                = var.ecs_service.iam_role_use_name_prefix
  iam_role_path                           = var.ecs_service.iam_role_path
  iam_role_description                    = var.ecs_service.iam_role_description
  iam_role_permissions_boundary           = var.ecs_service.iam_role_permissions_boundary
  iam_role_tags                           = var.ecs_service.iam_role_tags
  iam_role_statements                     = var.ecs_service.iam_role_statements
  create_task_definition                  = var.ecs_service.create_task_definition
  task_definition_arn                     = var.ecs_service.task_definition_arn
  container_definitions                   = var.ecs_service.container_definitions
  container_definition_defaults           = var.ecs_service.container_definition_defaults
  cpu                                     = var.ecs_service.cpu
  ephemeral_storage                       = var.ecs_service.ephemeral_storage
  family                                  = var.ecs_service.family
  inference_accelerator                   = var.ecs_service.inference_accelerator
  ipc_mode                                = var.ecs_service.ipc_mode
  memory                                  = var.ecs_service.memory
  network_mode                            = var.ecs_service.network_mode
  pid_mode                                = var.ecs_service.pid_mode
  task_definition_placement_constraints   = var.ecs_service.task_definition_placement_constraints
  proxy_configuration                     = var.ecs_service.proxy_configuration
  requires_compatibilities                = var.ecs_service.requires_compatibilities
  runtime_platform                        = var.ecs_service.runtime_platform
  skip_destroy                            = var.ecs_service.skip_destroy
  volume                                  = var.ecs_service.volume
  task_tags                               = var.ecs_service.task_tags
  create_task_exec_iam_role               = var.ecs_service.create_task_exec_iam_role
  task_exec_iam_role_arn                  = var.ecs_service.task_exec_iam_role_arn
  task_exec_iam_role_name                 = var.ecs_service.task_exec_iam_role_name
  task_exec_iam_role_use_name_prefix      = var.ecs_service.task_exec_iam_role_use_name_prefix
  task_exec_iam_role_path                 = var.ecs_service.task_exec_iam_role_path
  task_exec_iam_role_description          = var.ecs_service.task_exec_iam_role_description
  task_exec_iam_role_permissions_boundary = var.ecs_service.task_exec_iam_role_permissions_boundary
  task_exec_iam_role_tags                 = var.ecs_service.task_exec_iam_role_tags
  task_exec_iam_role_policies             = var.ecs_service.task_exec_iam_role_policies
  create_task_exec_policy                 = var.ecs_service.create_task_exec_policy
  task_exec_ssm_param_arns                = var.ecs_service.task_exec_ssm_param_arns
  task_exec_secret_arns                   = var.ecs_service.task_exec_secret_arns
  task_exec_iam_statements                = var.ecs_service.task_exec_iam_statements
  create_tasks_iam_role                   = var.ecs_service.create_tasks_iam_role
  tasks_iam_role_arn                      = var.ecs_service.tasks_iam_role_arn
  tasks_iam_role_name                     = var.ecs_service.tasks_iam_role_name
  tasks_iam_role_use_name_prefix          = var.ecs_service.tasks_iam_role_use_name_prefix
  tasks_iam_role_path                     = var.ecs_service.tasks_iam_role_path
  tasks_iam_role_description              = var.ecs_service.tasks_iam_role_description
  tasks_iam_role_permissions_boundary     = var.ecs_service.tasks_iam_role_permissions_boundary
  tasks_iam_role_tags                     = var.ecs_service.tasks_iam_role_tags
  tasks_iam_role_policies                 = var.ecs_service.tasks_iam_role_policies
  tasks_iam_role_statements               = var.ecs_service.tasks_iam_role_statements
  external_id                             = var.ecs_service.external_id
  scale                                   = var.ecs_service.scale
  force_delete                            = var.ecs_service.force_delete
  wait_until_stable                       = var.ecs_service.wait_until_stable
  wait_until_stable_timeout               = var.ecs_service.wait_until_stable_timeout
  enable_autoscaling                      = var.ecs_service.enable_autoscaling
  autoscaling_min_capacity                = var.ecs_service.autoscaling_min_capacity
  autoscaling_max_capacity                = var.ecs_service.autoscaling_max_capacity
  autoscaling_policies                    = var.ecs_service.autoscaling_policies
  autoscaling_scheduled_actions           = var.ecs_service.autoscaling_scheduled_actions
  create_security_group                   = var.ecs_service.create_security_group
  security_group_name                     = var.ecs_service.security_group_name
  security_group_use_name_prefix          = var.ecs_service.security_group_use_name_prefix
  security_group_description              = var.ecs_service.security_group_description
  security_group_rules                    = var.ecs_service.security_group_rules
  security_group_tags                     = var.ecs_service.security_group_tags
}


module "metric_alerm_1" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-cloudwatch.git//modules/metric-alarm?ref=af2b377591105fc50522cb202b93eef17cb1bcaa" #v5.3.1"
  count  = var.metric_alarm_1.create_metric_alarm ? 1 : 0

  create_metric_alarm                   = var.metric_alarm_1.create_metric_alarm
  alarm_name                            = var.metric_alarm_1.alarm_name
  alarm_description                     = var.metric_alarm_1.alarm_description
  comparison_operator                   = var.metric_alarm_1.comparison_operator
  evaluation_periods                    = var.metric_alarm_1.evaluation_periods
  threshold                             = var.metric_alarm_1.threshold
  threshold_metric_id                   = var.metric_alarm_1.threshold_metric_id
  unit                                  = var.metric_alarm_1.unit
  metric_name                           = var.metric_alarm_1.metric_name
  namespace                             = var.metric_alarm_1.namespace
  period                                = var.metric_alarm_1.period
  statistic                             = var.metric_alarm_1.statistic
  actions_enabled                       = var.metric_alarm_1.actions_enabled
  datapoints_to_alarm                   = var.metric_alarm_1.datapoints_to_alarm
  dimensions                            = var.metric_alarm_1.dimensions
  alarm_actions                         = [module.ecs_service[0].autoscaling_policies[var.metric_alarm_1.autoscaling_policies_id].arn]
  insufficient_data_actions             = var.metric_alarm_1.insufficient_data_actions
  ok_actions                            = var.metric_alarm_1.ok_actions
  extended_statistic                    = var.metric_alarm_1.extended_statistic
  treat_missing_data                    = var.metric_alarm_1.treat_missing_data
  evaluate_low_sample_count_percentiles = var.metric_alarm_1.evaluate_low_sample_count_percentiles
  metric_query                          = var.metric_alarm_1.metric_query
  tags                                  = var.metric_alarm_1.tags
}


module "metric_alerm_2" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-cloudwatch.git//modules/metric-alarm?ref=af2b377591105fc50522cb202b93eef17cb1bcaa" #v5.3.1"
  count  = var.metric_alarm_2.create_metric_alarm ? 1 : 0

  create_metric_alarm                   = var.metric_alarm_2.create_metric_alarm
  alarm_name                            = var.metric_alarm_2.alarm_name
  alarm_description                     = var.metric_alarm_2.alarm_description
  comparison_operator                   = var.metric_alarm_2.comparison_operator
  evaluation_periods                    = var.metric_alarm_2.evaluation_periods
  threshold                             = var.metric_alarm_2.threshold
  threshold_metric_id                   = var.metric_alarm_2.threshold_metric_id
  unit                                  = var.metric_alarm_2.unit
  metric_name                           = var.metric_alarm_2.metric_name
  namespace                             = var.metric_alarm_2.namespace
  period                                = var.metric_alarm_2.period
  statistic                             = var.metric_alarm_2.statistic
  actions_enabled                       = var.metric_alarm_2.actions_enabled
  datapoints_to_alarm                   = var.metric_alarm_2.datapoints_to_alarm
  dimensions                            = var.metric_alarm_2.dimensions
  alarm_actions                         = [module.ecs_service[0].autoscaling_policies[var.metric_alarm_2.autoscaling_policies_id].arn]
  insufficient_data_actions             = var.metric_alarm_2.insufficient_data_actions
  ok_actions                            = var.metric_alarm_2.ok_actions
  extended_statistic                    = var.metric_alarm_2.extended_statistic
  treat_missing_data                    = var.metric_alarm_2.treat_missing_data
  evaluate_low_sample_count_percentiles = var.metric_alarm_2.evaluate_low_sample_count_percentiles
  metric_query                          = var.metric_alarm_2.metric_query
  tags                                  = var.metric_alarm_2.tags
}
