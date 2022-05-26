provider "aws" {
  region = var.region
  shared_config_files = ["C:\\Users\\Parvathi A\\.aws\\config"]
shared_credentials_files = ["C:\\Users\\Parvathi A\\.aws\\credentials"]
}

module "vpc" {
  source = "./modules/vpc"
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.vpc.subnet_id
  instance_type = "t2.micro"
}