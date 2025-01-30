resource "aws_ecr_repository" "my_ecr_repo" {
  name = "demo-ecr" 

  encryption_configuration {
    encryption_type = "AES256" 
  }
}
