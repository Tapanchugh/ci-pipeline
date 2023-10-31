data "aws_caller_identity" "current" {}

resource "aws_iam_policy" "codecommit_branchprotection_policy" {
  name        = "${var.AWS_REPOSITORY_NAME}_${var.AWS_REPOSITORY_Branch_NAME}_BranchPolicy"
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
            "codecommit:References" = ["refs/heads/${var.AWS_REPOSITORY_Branch_NAME}"]
          }
        }
      }
    ]
  })
}
data "aws_iam_users" "all_users" {}

resource "aws_iam_user_policy_attachment" "attach_to_all_users" {
  for_each = toset(data.aws_iam_users.all_users.names)

  user = each.value
  policy_arn = aws_iam_policy.codecommit_branchprotection_policy.arn
}

