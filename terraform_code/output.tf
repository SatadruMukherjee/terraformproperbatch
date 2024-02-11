output "ECS_TASK_EXECUTION_ROLE" {
  value = aws_iam_role.aws_ecs_task_execution_role.arn
}


output "AWS_BATCH_JOB_NAME" {
  value = aws_batch_job_definition.batch_job.name
}



output "ECR_REPO_NAME" {
  value = aws_ecr_repository.repo_creation_tf.name
}