provider "aws" {
region     = "ap-south-1"

access_key = "AKIAVYJKGGKGBQ5IQERM"
secret_key = "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"

}

resource "aws_s3_bucket" "Basavaraj_S3" {
  bucket =  "my-tf-test-bucket-basavaraj"
  acl    =  "private"

  tags =  {
    Name = "My bucket_basa"
    Environment = "Dev"
  }
}


