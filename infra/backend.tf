# terraform {
#   backend "s3" {
#     bucket = "particle-terraform-state"
#     key    = "terraform/state"
#     region = "ap-south-1"
#     encrypt = true
#     use_lockfile = true
#   }
# }