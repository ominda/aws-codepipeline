resource "aws_cloudwatch_event_rule" "r_codeCommit_event" {
  name        = local.cloud_watch_event_name
  description = "Trigger the code Pipeline when code commit event occur"

  event_pattern = jsonencode({
        "source": ["aws.codecommit"],
        "detail-type": ["CodeCommit Repository State Change"],
        # "resources": ["arn:aws:codecommit:ap-southeast-1:352505165667:C-OPS-Poc_Dev-codeCommit-repository"],
        "resources": ["${aws_codecommit_repository.r_codeCommit_repository.arn}"],
        "detail": {
            "event": ["referenceCreated", "referenceUpdated"],
            "referenceType": ["branch"],
            "referenceName": ["main"]
        }
    })
}

resource "aws_cloudwatch_event_target" "r_codeCommit_event_target" {
  rule      = aws_cloudwatch_event_rule.r_codeCommit_event.name
  target_id = "TriggerCodePipeline"
  arn       = aws_codepipeline.r_codePipeline.arn
  role_arn = var.event_bridge_role
}
