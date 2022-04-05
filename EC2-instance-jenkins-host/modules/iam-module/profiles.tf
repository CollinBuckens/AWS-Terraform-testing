resource "aws_iam_instance_profile" "jenkins_host_profile" {
  name = "jenkins_host_profile"
  role = resource.aws_iam_role.jenkins_host_role.name
}