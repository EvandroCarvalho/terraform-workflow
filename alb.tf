resource "aws_alb" "this" {
  name            = "ECS-ALB"
  security_groups = [aws_security_group.sg_alb.id]
  subnets         = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]

  tags = {
    "Name" = "ECS ALB"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ecs_vpc.id

  health_check {
    path              = "/"
    healthy_threshold = 2
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_alb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward" # encaminhar a requisição
    target_group_arn = aws_lb_target_group.this.arn
  }
}