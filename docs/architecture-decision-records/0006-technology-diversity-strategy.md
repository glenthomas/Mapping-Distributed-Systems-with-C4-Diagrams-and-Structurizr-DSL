# 6. Adopt Technology Diversity Strategy

Date: 2025-08-28

## Status

Accepted

## Context

Different services in our platform have varying requirements and our development teams have different expertise:

- Some services require high-performance concurrent processing
- Others need rapid development and flexibility
- Team expertise spans Java, Node.js, Python, and Go
- Different domains may benefit from specialised frameworks and libraries
- We want to leverage the best tools for each specific use case

## Decision

We will adopt a controlled technology diversity approach with the following technology stack:

**Backend Services:**
- **Spring Boot/Java** - User Service, Order Management (enterprise-grade, strong consistency)
- **Node.js/Express** - Catalog Service, Inventory Service, Email Campaigns (rapid development, JSON handling)
- **Python/FastAPI** - Payment Service, Analytics Services (data processing, ML libraries)
- **Go** - Shipping Service (high-performance, concurrent processing)

**Frontend:**
- **React/JavaScript** - Web Application and Admin Panel (team expertise, component reusability)

**Infrastructure:**
- **Spring Cloud Gateway** - API Gateways (Java ecosystem integration)

## Consequences

**Positive:**
- Optimal technology choice for each service's requirements
- Leverages existing team expertise effectively
- Allows teams to use best-in-class libraries and frameworks
- Enables hiring specialists in different technologies
- Services can evolve independently with their optimal tech stack

**Negative:**
- Increased operational complexity with multiple runtimes
- Need for diverse skillsets in the team
- Different deployment and monitoring approaches
- Potential knowledge silos
- More complex CI/CD pipeline setup

**Mitigation:**
- Establish common patterns for logging, monitoring, and health checks
- Use containerisation (Docker) to standardise deployment
- Create shared libraries and templates for common functionality
- Implement cross-training programs for critical services
- Maintain clear documentation and architectural guidelines
