#!/bin/bash

# Deploy script for EquipVI React app
# Ensure AWS CLI is installed and configured with a key that has sufficient permissions.
# Default AWS region: us-east-1

set -e  # Exit on error

# Define variables
S3_BUCKET="bfdcv-static-site-bucket"
CLOUDFRONT_DISTRIBUTION_ID="EWA1XVL8BQ5KJ"
SCRIPT_NAME=$(basename "$0")

# Sync all files except deploy.sh to S3
echo "Syncing files to S3 bucket: $S3_BUCKET"
aws s3 sync . s3://$S3_BUCKET --exclude "$SCRIPT_NAME"

# Invalidate CloudFront cache
echo "Invalidating CloudFront cache..."
aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*" --region us-east-1

echo "Deployment complete!"
