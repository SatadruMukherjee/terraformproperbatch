output "ECS_TASK_EXECUTION_ROLE" {
  value = aws_iam_role.aws_ecs_task_execution_role.arn
}


output "AWS_BATCH_JOB_NAME" {
  value = aws_batch_job_definition.batch_job.name
}



output "ECR_REPO_NAME" {
  value = aws_ecr_repository.repo_creation_tf.name
}

output "aws_batch_JD_vcpu" {
  value = var.aws_batch_JD_vcpu
}

output "aws_batch_JD_memory" {
  value = var.aws_batch_JD_memory
}


output "EventBridge_Rule_Name" {
  value = var.eventbridge_rule_name
}



output "Batch_Job_Queue_ARN" {
  value = aws_batch_job_queue.batch_queue.arn
}


output "Scheduler_Batch_Role_ARN" {
  value = aws_iam_role.scheduler-batch-role.arn
}
