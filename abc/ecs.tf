resource "aws_ecs_cluster" "foo" {
  name = "my-ecs-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}




# resource "aws_ecs_task_definition" "service" {
#   family                   = "service-http"
#   requires_compatibilities = ["FARGATE"]
#   network_mode             = "awsvpc"
#   cpu                      = 512
#   memory                   = 1024
#   execution_role_arn       = "arn:aws:iam::935646287887:role/ecsTaskExecutionRole"
#   container_definitions = jsonencode([
#     {
#       name      = "first-task"
#       image     = "935646287887.dkr.ecr.eu-west-3.amazonaws.com/dayum:latest"
#       cpu       = 512
#       memory    = 1024
#       essential = true

#       portMappings = [
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ]
#     }
#   ])

# }
# resource "aws_ecs_service" "foo" {
#   name            = "my-ecs-service-http"
#   cluster         = aws_ecs_cluster.foo.id
#   task_definition = aws_ecs_task_definition.service.arn
#   desired_count   = 10
#   launch_type     = "FARGATE"
#   network_configuration {
#     subnets          = [aws_subnet.subnet-a-prv.id]
#     security_groups  = ["sg-040c28ce1bf3c900f"]
#     assign_public_ip = false
#   }

#   load_balancer {
#     target_group_arn = aws_lb_target_group.alb-tg-group.arn
#     container_name   = "first-task"
#     container_port   = 80
#   }
#   depends_on = [aws_ecs_task_definition.service]
# }