data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "codecommit_branchprotection_policy" {
  name        = "${var.AWS_REPOSITORY_NAME}-BranchPolicy"
  description = "IAM policy to protect main branch of CodeCommit test repository"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Deny",
        Action = [
      "codecommit:DeleteBranch",
      "codecommit:PutFile",
      "codecommit:DeleteFile",
    ]
        Resource = "arn:aws:codecommit:${var.AWS_REGION}:${data.aws_caller_identity.current.account_id}:${var.AWS_REPOSITORY_NAME}",
        Condition = {
          StringEqualsIfExists = {
            "codecommit:References" = ["refs/heads/main"]
          }
        }
      }
    ]
  })
}
