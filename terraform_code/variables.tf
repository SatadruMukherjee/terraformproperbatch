
variable aws_batch_ecs_task_execution_policy_list {
  type = list
  default = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy","arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
}



variable aws_batch_compute_env_max_vcpu {
  default = 1
}


variable aws_batch_compute_env_security_groups {
  default = ["sg-0a2a8f58b5a8143ad"]
}



variable aws_batch_compute_env_subnet_groups {
  default = ["subnet-04d5b3850b2a96a34",
            "subnet-06c13760e12be3492",
            "subnet-095831b3f93aaf1d2",
            "subnet-0b0cb1f1b53ad1a8a",
            "subnet-0593781c627b89142",
            "subnet-03a4055dd5d656279"]
}



variable aws_batch_job_queue_priority {
  default = "0"
}


variable aws_batch_JD_vcpu {
  default = "0.25"
}



variable aws_batch_JD_memory {
  default = "512"
}

variable batch_job_schedule_expression {
  default = "rate(2 minutes)"
}