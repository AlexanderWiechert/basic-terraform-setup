resource "aws_s3_bucket" "this" {
  bucket = "${var.project_name}-${var.environment}"

  tags = merge(
    var.tags,
    {
      "Name" = var.project_name
      "Environment" = var.environment
    },
  )
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*"
    ]
    resources = [
      aws_s3_bucket.this.arn,
      "${aws_s3_bucket.this.arn}/*"
    ]

  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.this.bucket
  key    = "TESTFILE"
  source = "${path.cwd}/${path.module}/TESTFILE"
  etag = filemd5("${path.cwd}/${path.module}/TESTFILE")
}