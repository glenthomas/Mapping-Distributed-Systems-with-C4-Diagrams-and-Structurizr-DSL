# 7. Separate E-commerce and Fulfillment Systems

Date: 2025-08-28

## Status

Accepted

## Context

Traditional e-commerce architectures often tightly couple order management with fulfillment processes. However, we have identified distinct concerns:

**E-commerce System Concerns:**
- Customer experience and order capture
- Product catalog management
- Payment processing
- User account management

**Fulfillment System Concerns:**
- Inventory management and reservations
- Warehouse operations (picking, packing)
- Shipping carrier integration
- Order tracking and notifications

These domains have different scaling patterns, business rules, and operational requirements.

## Decision

We will implement separate E-commerce and Fulfillment systems as distinct bounded contexts:

**E-commerce System** will handle:
- Customer-facing web application
- Product catalog and search
- Order placement and payment processing
- Customer account management

**Fulfillment System** will handle:
- Order management and validation
- Inventory tracking and reservations
- Warehouse operations coordination
- Shipping and delivery management

Communication between systems will be event-driven, with the E-commerce system publishing order events that the Fulfillment system consumes.

## Consequences

**Positive:**
- Clear separation of business concerns and responsibilities
- Independent scaling based on different usage patterns
- Fulfillment system can serve multiple sales channels (web, mobile, B2B)
- Different teams can own and optimise each system independently
- Better fault isolation - fulfillment issues don't impact order placement
- Easier integration with external fulfillment providers

**Negative:**
- More complex order-to-delivery workflow spanning systems
- Eventual consistency between order status and fulfillment status
- Need for sophisticated event handling and error recovery
- More complex customer experience for order tracking

**Mitigation:**
- Implement robust event-driven communication patterns
- Design clear APIs for order status synchronisation
- Use saga patterns for distributed transaction management
- Provide unified customer experience through API composition
