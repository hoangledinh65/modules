
resource "aws_instance" "hoangdl-amz-ec2" {
  count         = var.isCreated
  ami           = "ami-0c802847a7dd848c0"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ data.terraform_remote_state.networking.outputs.sg-id ]
  tags = {
    Name = "hoangdl-amz-ec223"
  }
}

data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = "dinhlehoangdemo-terraform-state-dev"
    key    = "vpc/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
