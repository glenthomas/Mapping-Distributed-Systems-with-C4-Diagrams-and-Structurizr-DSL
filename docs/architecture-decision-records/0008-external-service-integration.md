# 8. Integrate with External Service Providers

Date: 2025-08-28

## Status

Accepted

## Context

Building all capabilities in-house would require significant development effort and expertise in specialised domains. We have identified several areas where external service providers offer mature, reliable solutions:

- Payment processing with PCI compliance
- Email delivery with high deliverability rates
- Shipping and logistics with multiple carriers
- Tax calculation with regulatory compliance
- Analytics and business intelligence
- CRM functionality
- Product search with advanced algorithms

## Decision

We will integrate with best-of-breed external service providers for non-core functionality:

**External Systems:**
- **Payment Provider** - Handle payment processing, fraud detection, PCI compliance
- **Email Service** - Transactional emails, marketing campaigns, deliverability management
- **Shipping Provider** - Multi-carrier shipping, rate calculation, tracking
- **Tax Calculation Service** - Tax compliance, rate calculation, reporting
- **Analytics Platform** - Business intelligence, data warehousing, reporting
- **CRM System** - Customer relationship management, sales pipeline
- **Search Service** - Advanced product search, recommendations, personalisation

**Integration Approach:**
- API-first integration with well-defined service contracts
- Event-driven updates for data synchronisation
- Fallback mechanisms for service unavailability

## Consequences

**Positive:**
- Faster time-to-market by leveraging existing solutions
- Access to specialised expertise and advanced features
- Reduced development and maintenance costs for non-core functionality
- Better compliance and security for regulated areas (payments, taxes)
- Automatic updates and improvements from service providers

**Negative:**
- Vendor dependency and potential lock-in
- Integration complexity and maintenance overhead
- Data privacy and security concerns with external data sharing
- Potential service availability issues outside our control
- Ongoing subscription costs

**Mitigation:**
- Implement adapter patterns to minimise vendor lock-in
- Establish SLAs and monitoring for external service availability
- Use circuit breakers and fallback mechanisms
- Regular review of vendor contracts and alternatives
- Data encryption and privacy controls for external integrations
