variable AWS_DEFAULT_REGION {
  #default="batch_service_policy_for_compute"
  type        = string
  description = "AWS Region Name"
}


variable BATCH_JOB_COMPUTE_SERVICE_POLICY_NAME {
  default="batch_service_policy_for_compute"
  type        = string
  description = "AWS Batch Job Compute Service Policy"
}


variable BATCH_JOB_COMPUTE_SERVICE_ROLE_NAME {
  default="tf_aws_batch_service_compute_role"
  type        = string
  description = "AWS Batch Job Compute Service Role"
}

variable AWS_ECS_TASK_EXECUTION_ROLE_NAME {
  default="tf_ecs_task_execution_role"
  type        = string
  description = "AWS ECS Task Exection Role"
}


variable SCHEDULER_POLICY_NAME {
  default="scheduler_batch_policy"
  type        = string
  description = "AWS EventBridge Scheduler Policy"
}


variable SCHEDULER_ROLE_NAME {
  default="scheduler-batch-role"
  type        = string
  description = "AWS EventBridge Scheduler Role"
}

variable BATCH_COMPUTE_ENV_NAME {
  #default="batch_compute_env_tf"
  type        = string
  description = "AWS Batch Compute Env"
}




variable AWS_BATCH_ECS_TASK_EXECUTION_POLICY_LIST {
  type = list
  #default = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy","arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
  description = "AWS Batch ECS Task Execution Policy List"
}



variable AWS_BATCH_COMPUTE_ENV_MAX_VCPU {
  #default = 1
  type        = string
  description = "AWS Batch Compute Env Max VCPU"
}


variable AWS_BATCH_COMPUTE_ENV_SECURITY_GROUPS {
  #default = ["sg-0a2a8f58b5a8143ad"]
  type        = list(string)
  description = "AWS Batch Compute Env Security Group"
}



variable AWS_BATCH_COMPUTE_ENV_SUBNET_GROUPS {
  # default = ["subnet-04d5b3850b2a96a34",
  #           "subnet-06c13760e12be3492",
  #           "subnet-095831b3f93aaf1d2",
  #           "subnet-0b0cb1f1b53ad1a8a",
  #           "subnet-0593781c627b89142",
  #           "subnet-03a4055dd5d656279"]
  type        = list(string)
  description = "AWS Batch Compute Env Subnet Group"
}


variable AWS_BATCH_JOB_QUEUE_NAME {
  #default = "batch_queue_tf"
  type        = string
  description = "AWS Batch Queue"
}




variable AWS_BATCH_JOB_QUEUE_PRIORITY {
  #default = "0"
  type        = string
  description = "AWS Batch Queue Priority"
}


variable AWS_BATCH_JOB_NAME {
  #default =  "batch_queue_job_definition_tf"
  type        = string
  description = "AWS Batch Job Name"
}


variable AWS_BATCH_JD_VCPU {
  #default = "0.25"
  type        = string
  description = "VCPU for AWS Batch Job Description"
}



variable AWS_BATCH_JD_MEMORY {
  #default = "512"
  type        = string
  description = "Memory for AWS Batch Job Description"
}

variable AWS_ECR_REPO_NAME {
  #default = "ecr_repo_tf"
  type        = string
  description = "AWS ECR Repo Name"
}




variable BATCH_JOB_SCHEDULE_EXPRESSION {
  #default = "rate(2 minutes)"
  type        = string
  description = "AWS Batch Schedule Expression"
}


variable EVENTBRIDGE_RULE_NAME {
  #default = "Batch_Task_Scheduler"
  type        = string
  description = "AWS Batch Eventbridge Rule Name"
}