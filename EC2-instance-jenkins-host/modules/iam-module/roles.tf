# This configures the jenkins host role.
resource "aws_iam_role" "jenkins_host_role" {
  name = "jenkins_host_role"

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
    name        = "jenkins_host_${var.env_suffix}"
    Environment = "${var.env_suffix}"
  }
}