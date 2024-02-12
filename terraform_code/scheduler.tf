resource "aws_scheduler_schedule" "cron" {
  name        = "Batch_Task_Scheduler"
  group_name  = "default"
  depends_on = [aws_iam_policy.scheduler_batch_policy,aws_iam_role.scheduler-batch-role,aws_batch_job_definition.batch_job,aws_batch_job_queue.batch_queue]
  flexible_time_window {
    mode = "OFF"
  }

  #schedule_expression = "cron(*/30 * * * ? *)" # run every 30 minutes
  schedule_expression = var.batch_job_schedule_expression
  schedule_expression_timezone = "Asia/Calcutta" # Default is UTC
  state  = "DISABLED"
  description = "submitJob Batch event"

  target {
    arn = "arn:aws:scheduler:::aws-sdk:batch:submitJob"
    role_arn = aws_iam_role.scheduler-batch-role.arn
  
    input = jsonencode({
        "JobName": "scheduled-batch-job",
        "JobDefinition": "${aws_batch_job_definition.batch_job.arn}",
        "JobQueue": "${aws_batch_job_queue.batch_queue.arn}"
    })
  }
}
