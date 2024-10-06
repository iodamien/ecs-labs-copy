# resource "aws_iam_role" "ec2_role" {
#   name = "ec2-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

# }

# resource "aws_iam_instance_profile" "main_profile" {
#   name = "ec2-instance-profile"
#   role = aws_iam_role.ec2_role.name
# }

# data "aws_iam_policy" "ec2ssm" {
#   # arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
#   arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_role_policy_attachment" "attachofSSM" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = data.aws_iam_policy.ec2ssm.arn
# }

# resource "aws_instance" "web2" {
#   ami                  = "ami-05b5a865c3579bbc4"
#   instance_type        = "t3.medium"
#   subnet_id            = aws_subnet.subnet-a-prv.id
#   iam_instance_profile = aws_iam_instance_profile.main_profile.id
#   user_data_base64     = filebase64("userdata.sh")

#   tags = {
#     Name = "SSMTestEC2-subA"
#   }
# }