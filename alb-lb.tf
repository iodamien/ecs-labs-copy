# resource "aws_lb_target_group" "alb-tg-group" {
#   name        = "tf-alb-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "ip"
#   vpc_id      = aws_vpc.main.id
# }


# resource "aws_lb" "test" {
#   name               = "alb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["sg-040c28ce1bf3c900f"]
#   subnets            = [aws_subnet.subnet-a-pub.id,aws_subnet.subnet-b-pub.id]
# }

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.test.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.alb-tg-group.arn
#   }
# }