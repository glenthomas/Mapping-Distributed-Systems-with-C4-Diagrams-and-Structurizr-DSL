# Static Website Hosting with AWS S3 and CloudFront

This Terraform configuration creates a complete static website hosting solution using AWS S3 and CloudFront, following AWS best practices for security and performance.

## Architecture

- **S3 Bucket**: Hosts static website files with versioning and encryption enabled
- **CloudFront**: Global CDN for fast content delivery with HTTPS support
- **Origin Access Control (OAC)**: Secure access from CloudFront to S3 (replaces legacy OAI)
- **Route53** (optional): DNS management for custom domains
- **ACM Certificate** (optional): SSL/TLS certificate for HTTPS with custom domain

## Features

✅ **Security Best Practices**
- S3 bucket blocked from public access
- CloudFront Origin Access Control (OAC) for secure S3 access
- HTTPS enforced (HTTP redirects to HTTPS)

✅ **Performance Optimisations**
- CloudFront CDN for global content delivery
- Gzip compression enabled
- Configurable cache TTL settings

✅ **Production Ready**
- Custom domain support with SSL certificates
- Route53 DNS integration

## Prerequisites

1. **AWS CLI configured** with appropriate credentials
2. **Terraform installed** (>= 1.0)
3. **Domain and SSL certificate** (optional, for custom domain)
   - SSL certificate must be in `us-east-1` region for CloudFront
   - Route53 hosted zone for your domain

## Quick Start

### 1. Clone and Setup

```bash
cd deployment/static-site-hosting
```

### 2. Deploy Infrastructure

```bash
# Initialize Terraform
terraform init

# Review the plan
terraform plan

# Apply the configuration
terraform apply
```

### 3. Upload Website Files
```bash
# Upload your static files to the S3 bucket
aws s3 sync ./website-files s3://your-bucket-name --delete

# Invalidate CloudFront cache (if needed)
aws cloudfront create-invalidation \\
  --distribution-id $(terraform output -raw cloudfront_distribution_id) \\
  --paths "/*"
```

## File Upload and Management

### Upload Files
```bash
# Sync entire directory
aws s3 sync ./dist s3://your-bucket-name --delete

# Upload single file
aws s3 cp index.html s3://your-bucket-name/
```

### Invalidate CloudFront Cache
```bash
# Invalidate all files
aws cloudfront create-invalidation \\
  --distribution-id DISTRIBUTION_ID \\
  --paths "/*"

# Invalidate specific files
aws cloudfront create-invalidation \\
  --distribution-id DISTRIBUTION_ID \\
  --paths "/index.html" "/css/*"
```

## Security Considerations

1. **S3 Bucket Access**: Bucket is completely blocked from public access
2. **CloudFront OAC**: Only CloudFront can access S3 content
3. **HTTPS Only**: All HTTP traffic is redirected to HTTPS

## Cleanup

To destroy all resources:
```bash
terraform destroy
```
