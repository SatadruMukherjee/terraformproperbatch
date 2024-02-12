variable AWS_DEFAULT_REGION {
  #default="batch_service_policy_for_compute"
  type        = string
  description = "AWS Region Name"
}


variable batch_job_compute_service_policy_name {
  default="batch_service_policy_for_compute"
  type        = string
  description = "AWS Batch Job Compute Service Policy"
}


variable batch_job_compute_service_role_name {
  #default="tf_aws_batch_service_compute_role"
  type        = string
  description = "AWS Batch Job Compute Service Role"
}

variable aws_ecs_task_execution_role_name {
  #default="tf_ecs_task_execution_role"
  type        = string
  description = "AWS ECS Task Exection Role"
}


variable scheduler_policy_name {
  #default="scheduler_batch_policy"
  type        = string
  description = "AWS EventBridge Scheduler Policy"
}


variable scheduler_role_name {
  #default="scheduler-batch-role"
  type        = string
  description = "AWS EventBridge Scheduler Role"
}

variable batch_compute_env_name {
  #default="batch_compute_env_tf"
  type        = string
  description = "AWS Batch Compute Env"
}




variable aws_batch_ecs_task_execution_policy_list {
  type = list
  #default = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy","arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
  description = "AWS Batch ECS Task Execution Policy List"
}



variable aws_batch_compute_env_max_vcpu {
  #default = 1
  type        = string
  description = "AWS Batch Compute Env Max VCPU"
}


variable aws_batch_compute_env_security_groups {
  #default = ["sg-0a2a8f58b5a8143ad"]
  type        = list(string)
  description = "AWS Batch Compute Env Security Group"
}



variable aws_batch_compute_env_subnet_groups {
  # default = ["subnet-04d5b3850b2a96a34",
  #           "subnet-06c13760e12be3492",
  #           "subnet-095831b3f93aaf1d2",
  #           "subnet-0b0cb1f1b53ad1a8a",
  #           "subnet-0593781c627b89142",
  #           "subnet-03a4055dd5d656279"]
  type        = list(string)
  description = "AWS Batch Compute Env Subnet Group"
}


variable aws_batch_job_queue_name {
  #default = "batch_queue_tf"
  type        = string
  description = "AWS Batch Queue"
}




variable aws_batch_job_queue_priority {
  #default = "0"
  type        = string
  description = "AWS Batch Queue Priority"
}


variable aws_batch_job_name {
  #default =  "batch_queue_job_definition_tf"
  type        = string
  description = "AWS Batch Job Name"
}


variable aws_batch_JD_vcpu {
  #default = "0.25"
  type        = string
  description = "VCPU for AWS Batch Job Description"
}



variable aws_batch_JD_memory {
  #default = "512"
  type        = string
  description = "Memory for AWS Batch Job Description"
}

variable aws_ecr_repo_name {
  #default = "ecr_repo_tf"
  type        = string
  description = "AWS ECR Repo Name"
}




variable batch_job_schedule_expression {
  #default = "rate(2 minutes)"
  type        = string
  description = "AWS Batch Schedule Expression"
}


variable eventbridge_rule_name {
  #default = "Batch_Task_Scheduler"
  type        = string
  description = "AWS Batch Eventbridge Rule Name"
}