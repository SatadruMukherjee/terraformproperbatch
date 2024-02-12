
resource "aws_batch_compute_environment" "batch_compute" {
  compute_environment_name = var.batch_compute_env_name
  
  compute_resources {
    max_vcpus = var.aws_batch_compute_env_max_vcpu
    security_group_ids = var.aws_batch_compute_env_security_groups
    subnets = var.aws_batch_compute_env_subnet_groups
    type = "FARGATE"
  }
  service_role = aws_iam_role.aws_batch_service_compute_role.arn
  type         = "MANAGED"
  depends_on = [
    aws_iam_policy.batch_job_compute_service_policy,aws_iam_role.aws_batch_service_compute_role,aws_iam_role_policy_attachment.aws_batch_service_compute_role_policy_attachment
  ]
}

resource "aws_batch_job_queue" "batch_queue" {
  name     = var.aws_batch_job_queue_name
  state    = "ENABLED"
  priority = var.aws_batch_job_queue_priority
  compute_environments = [
    aws_batch_compute_environment.batch_compute.arn,
  ]
  depends_on = [aws_batch_compute_environment.batch_compute]
}

resource "aws_batch_job_definition" "batch_job" {
  depends_on = [aws_iam_role.aws_ecs_task_execution_role]
  name = var.aws_batch_job_name
  type = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = jsonencode({
    command    = ["echo","hello world"]
    image      = "public.ecr.aws/amazonlinux/amazonlinux:latest"
    jobRoleArn = aws_iam_role.aws_ecs_task_execution_role.arn

    fargatePlatformConfiguration = {
      platformVersion = "LATEST"
    }

    networkConfiguration = {
      assignPublicIp = "ENABLED"
    }

    resourceRequirements = [
      {
        type  = "VCPU"
        value = var.aws_batch_JD_vcpu
      },
      {
        type  = "MEMORY"
        value = var.aws_batch_JD_memory
      }
    ]

    executionRoleArn = aws_iam_role.aws_ecs_task_execution_role.arn
  })
}
