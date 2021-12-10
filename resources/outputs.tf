output instanceTags {
  value = aws_instance.challenge_instance.tags
}

output bucketsTags {
  value = aws_s3_bucket.cesar_munoz_flugel_challenge.tags
}