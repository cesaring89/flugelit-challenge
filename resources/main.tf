resource "aws_s3_bucket" "cesar_munoz_flugel_challenge" {
  bucket = "cesar-munoz-flugel-challenge"
  acl    = "private"

  tags = {
    Name        = var.Name
    Environment = var.Owner
  }
}

resource "aws_instance" "challenge_instance" {
  ami           = "ami-0ed9277fb7eb570c9" # us-east-1
  instance_type = "t2.micro"

  tags = {
    Name        = var.Name
    Environment = var.Owner
  }

}
