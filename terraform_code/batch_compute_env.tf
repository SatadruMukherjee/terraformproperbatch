
resource "aws_batch_compute_environment" "batch_compute" {
  compute_environment_name = "batch_compute_env_tf"
  
  compute_resources {
    max_vcpus = var.aws_batch_compute_env_max_vcpu
    security_group_ids = var.aws_batch_compute_env_security_groups
    subnets = var.aws_batch_compute_env_subnet_groups
    type = "FARGATE"
  }
  service_role = aws_iam_role.aws_batch_service_compute_role.arn
  type         = "MANAGED"
  depends_on = [
    aws_iam_role.aws_batch_service_compute_role
  ]
}

resource "aws_batch_job_queue" "batch" {
  name     = "batch_queue_tf"
  state    = "ENABLED"
  priority = var.aws_batch_job_queue_priority
  compute_environments = [
    aws_batch_compute_environment.batch_compute.arn,
  ]
  depends_on = [aws_batch_compute_environment.batch_compute]
}

resource "aws_batch_job_definition" "batch_job" {
  depends_on = [aws_iam_role.aws_ecs_task_execution_role]
  name = "batch_queue_job_definition_tf"
  type = "container"

  platform_capabilities = [
    "FARGATE",
  ]

  container_properties = jsonencode({
    command    = ["echo", "test"]
    image      = "825865577047.dkr.ecr.us-east-1.amazonaws.com/demotest123:dc8060a4e273b130bdc67e4c0c867e78aae8dfef"
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
        value = var.aws_batch_job_queue_memory
      }
    ]

    executionRoleArn = aws_iam_role.aws_ecs_task_execution_role.arn
  })
}
