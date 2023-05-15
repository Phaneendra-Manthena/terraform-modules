resource "aws_lb" "main" {
  name               = var.app_alb_name
  load_balancer_type = "application"
  subnets            = var.private_subnet_ids
  security_groups    = var.app_alb_security_group_id

  tags = merge(var.tags, var.app_alb_tags)
}

resource "aws_lb_target_group" "main" {
  name_prefix          = var.alb_name_prefix
  port                 = var.alb_backend_port
  protocol             = var.alb_backend_protocol
  target_type          = var.alb_target_type
  deregistration_delay = var.alb_deregistration_delay
  vpc_id               = var.vpc_id

  health_check {
    enabled             = true
    interval            = var.alb_interval
    path                = var.alb_healthcheck_path
    healthy_threshold   = var.alb_healthy_threshold
    unhealthy_threshold = var.alb_unhealthy_threshold
    matcher             = "200-399"
  }

  tags = merge(var.tags, var.app_alb_tags)
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.alb_listner_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
