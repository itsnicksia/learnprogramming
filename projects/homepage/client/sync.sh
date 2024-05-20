aws s3 sync . s3://628602948023-learnprogramming --delete
aws cloudfront create-invalidation --distribution-id EVF5M3I81ONIU --paths "/*"