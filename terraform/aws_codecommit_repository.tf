resource "aws_codecommit_repository" "aws-repo" {
  repository_name = "${var.AWS_REPOSITORY_NAME}"
}

resource "aws_codecommit_approval_rule_template" "approvalrule" {
  name        = "${var.AWS_REPOSITORY_NAME}-approvalrule"
  description = "This is an example approval rule template"

  content = jsonencode({
    Version               = "2018-11-08"
    DestinationReferences = ["refs/heads/main"]
    Statements = [{
      Type                    = "Approvers"
      NumberOfApprovalsNeeded = 1
      ApprovalPoolMembers     = ["arn:aws:iam::072255855772:user/approver"]
    }]
  })
}

resource "aws_codecommit_approval_rule_template_association" "example" {
  approval_rule_template_name = aws_codecommit_approval_rule_template.approvalrule.name
  repository_name             = "${var.AWS_REPOSITORY_NAME}"
}
