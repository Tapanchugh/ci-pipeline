resource "aws_codecommit_repository" "aws-repo" {
  repository_name = "${var.AWS_REPOSITORY_NAME}"
}

resource "aws_codecommit_approval_rule_template" "approvalrule" {
  name        = "${var.AWS_REPOSITORY_NAME}_approvalrule_${var.AWS_REPOSITORY_Branch_NAME}_branch"
  description = "This is an pull request approval rule template for ${var.AWS_REPOSITORY_Branch_NAME} Branch"

  content = jsonencode({
    Version               = "2018-11-08"
    DestinationReferences = ["refs/heads/${var.AWS_REPOSITORY_Branch_NAME}"]
    Statements = [{
      Type                    = "Approvers"
      NumberOfApprovalsNeeded = "${var.AWS_REPOSITORY_Numberofapprovals}"
      ApprovalPoolMembers     = ["${var.AWS_REPOSITORY_ApproverARN}"]
    }]
  })
}

resource "aws_codecommit_approval_rule_template_association" "approval_rule_association" {
  approval_rule_template_name = aws_codecommit_approval_rule_template.approvalrule.name
  repository_name             = "${var.AWS_REPOSITORY_NAME}"
}
