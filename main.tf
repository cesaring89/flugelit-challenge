resource "aws_s3_bucket" "cesar_munoz_flugel_challenge" {
  bucket = "cesar_munoz_flugel_challenge"
  acl    = "private"

  tags = {
    Name        = var.Name
    Environment = var.Owner
  }
}

resource "aws_instance" "challenge_instance" {
  ami           = "ami-005e54dee72cc1d00" # us-east-1
  instance_type = "t2.micro"

  tags = {
    Name        = var.Name
    Environment = var.Owner
  }

}
