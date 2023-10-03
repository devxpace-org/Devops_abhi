
terraform {
  backend "s3" {
    bucket         = "mys3abhi" 
    key            = "terraform.tfstate"  
    region         = "us-east-1"          
  }
}
