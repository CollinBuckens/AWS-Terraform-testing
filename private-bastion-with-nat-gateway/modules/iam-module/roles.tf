resource "aws_iam_role" "bastion_role" {
  name = "bastion_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })

  tags = {
    Terraform   = true
    name        = "bastion_role_${var.env_suffix}"
    Environment = "${var.env_suffix}"
  }
}