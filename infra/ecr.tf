resource "aws_ecr_repository" "app_ecr" {
  name = "demo-ecr" 

  encryption_configuration {
    encryption_type = "AES256" 
  }
}
