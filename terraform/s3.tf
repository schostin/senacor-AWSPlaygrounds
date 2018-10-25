resource "aws_s3_bucket" "lambdaBucket" {
  bucket = "${var.s3_bucket_name}"

  tags {
    Name = "Lambda Code Bucket"
    Environment = "Dev"
  }
}
