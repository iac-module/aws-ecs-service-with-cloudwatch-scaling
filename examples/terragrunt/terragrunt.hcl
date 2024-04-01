include {
  path = find_in_parent_folders()
}
iam_role = local.account_vars.iam_role

terraform {
  source = "git::https://github.com/iac-module/aws-ecs-service-with-cloudwatch-scaling.git//?ref=v1.0.0"
}

locals {
  common_tags            = read_terragrunt_config(find_in_parent_folders("tags.hcl"))
  account_vars           = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars            = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  region                 = local.region_vars.locals.aws_region
  name                   = basename(get_terragrunt_dir())
  ssm_paramastore_secret = "/${local.account_vars.locals.owner}/${local.account_vars.locals.env_name}/app/backends/shared/secret/"
  ssm_paramastore_plain  = "/${local.account_vars.locals.owner}/${local.account_vars.locals.env_name}/app/backends/shared/plain/"
}
dependency "vpc" {
  config_path = find_in_parent_folders("core/vpc/${local.account_vars.locals.env_name}")
}
dependency "ecs-cluster" {
  config_path = find_in_parent_folders("clusters/${local.account_vars.locals.env}-ecs-0001")
}
dependency "backend-s3-backend-access" {
  config_path = find_in_parent_folders("core/iam/policies/backend-s3-backend-access")
}
dependency "backend-s3-media-access" {
  config_path = find_in_parent_folders("core/iam/policies/backend-s3-media-access")
}
dependency "backend-s3-sqs-bucket-access" {
  config_path = find_in_parent_folders("core/iam/policies/backend-s3-sqs-bucket-access")
}
dependency "backend-sqs-access" {
  config_path = find_in_parent_folders("core/iam/policies/backend-sqs-access")
}
dependency "sqs" {
  config_path = find_in_parent_folders("sqs/default-queue")
}
dependency "backend-comprehend" {
  config_path = find_in_parent_folders("core/iam/policies/backend-comprehend")
}

inputs = {
  ecs_service = {
    name          = "${local.account_vars.locals.env_name}-${local.name}"
    cluster_arn   = dependency.ecs-cluster.outputs.arn
    cpu           = 256
    memory        = 512
    desired_count = 0
    tasks_iam_role_policies = {
      "AmazonRekognitionFullAccess" = "arn:aws:iam::aws:policy/AmazonRekognitionFullAccess"
      "BackendS3BackendAccess"      = dependency.backend-s3-backend-access.outputs.arn
      "BackendS3SQSBucketAccess"    = dependency.backend-s3-sqs-bucket-access.outputs.arn
      "BackendS3MediaAccess"        = dependency.backend-s3-media-access.outputs.arn
      "BackendSQSAccess"            = dependency.backend-sqs-access.outputs.arn
      "BackendComprehendAccess"     = dependency.backend-comprehend.outputs.arn
    }
    enable_autoscaling       = true
    autoscaling_min_capacity = 1
    autoscaling_max_capacity = 5
    autoscaling_policies = {
      "sqs" : {
        "policy_type" : "StepScaling",
        "step_scaling_policy_configuration" : {
          adjustment_type : "ExactCapacity"
          cooldown : 60
          metric_aggregation_type : "Average"
          "step_adjustment" : {
            0 : {
              "metric_interval_lower_bound" : "0"
              "metric_interval_upper_bound" : "1"
              "scaling_adjustment" : "1"
            }
            1 : {
              "metric_interval_lower_bound" : "1"
              "metric_interval_upper_bound" : "2"
              "scaling_adjustment" : "1"
            }
            2 : {
              "metric_interval_lower_bound" : "2"
              "metric_interval_upper_bound" : "3"
              "scaling_adjustment" : "2"
            }
            x : {
              "metric_interval_lower_bound" : "3"
              "scaling_adjustment" : "5"
            }
          }
        }
      }
    }
    requires_compatibilities = ["EC2"]
    capacity_provider_strategy = {
      ex_1 = {
        capacity_provider = dependency.ecs-cluster.outputs.autoscaling_capacity_providers["spot-t3-small"].name
        weight            = 1
        base              = 1
      }
    }
    container_definitions = {
      (local.name) = {
        image              = "${local.account_vars.locals.aws_account_id}.dkr.ecr.${local.region}.amazonaws.com/backend-image:${local.account_vars.locals.env}-latest"
        cpu                = 256
        memory             = 512
        memory_reservation = 512
        secrets = [
          {
            name      = "API_URL"
            valueFrom = "${local.ssm_paramastore_plain}API_URL"
          }
        ]
        command = ["/scripts/workers/start-worker-default.sh"]
        readonly_root_filesystem = false
      }
    }
    subnet_ids = dependency.vpc.outputs.private_subnets
    security_group_rules = {
      egress_all = {
        type        = "egress"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        description = "allow outgoing traffic"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    tags = local.common_tags.locals.common_tags
  }
  metric_alarm = {
    alarm_name          = "autoscaling_alert_${local.name}"
    alarm_description   = "Alarm for autoscaling service: ${local.name}"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = 1
    threshold           = 0
    period              = 30
    unit                = "Count"
    namespace           = "AWS/SQS"
    metric_name         = "ApproximateNumberOfMessagesVisible"
    statistic           = "Average"
    dimensions = {
      "QueueName" = dependency.sqs.outputs.queue_name
    }
    tags = local.common_tags.locals.common_tags
  }
}
