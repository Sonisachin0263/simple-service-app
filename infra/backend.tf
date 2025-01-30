 terraform {
   backend "s3" {
     bucket = "particle-terraform-state"
     key    = "terraform/state.tfstate"
     region = "ap-south-1"
     encrypt = true
     dynamodb_table = "terraform-lock"
   }
}