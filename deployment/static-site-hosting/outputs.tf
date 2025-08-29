output "website_url" {
  description = "URL of the static website"
  value       = "https://${local.domain_name}"
}

output "domain_name" {
  description = "Custom domain name"
  value       = local.domain_name
}
