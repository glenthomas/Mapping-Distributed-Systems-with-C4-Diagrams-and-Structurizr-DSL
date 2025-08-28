# 3. Use Polyglot Persistence Strategy

Date: 2025-08-28

## Status

Accepted

## Context

Different parts of our e-commerce platform have varying data requirements:

- User accounts need ACID transactions and relational integrity
- Product catalogs benefit from flexible schema and fast reads
- Order data requires strong consistency and auditability
- Marketing analytics need fast aggregations and flexible querying
- Inventory tracking requires real-time updates and consistency

A single database technology cannot optimally serve all these diverse needs.

## Decision

We will implement a polyglot persistence strategy using different database technologies optimised for specific use cases:

- **PostgreSQL** for transactional data (users, orders, campaigns, analytics)
- **MongoDB** for flexible schema data (product catalogs, customer segments, inventory)
- **MySQL** for warehouse operations data (established team expertise)

Each microservice will own its data and database, following the database-per-service pattern.

## Consequences

**Positive:**
- Optimal performance for each data access pattern
- Services can evolve their data models independently
- Technology choice matches team expertise and use case requirements
- Better scalability through specialised database optimisations

**Negative:**
- Increased operational complexity managing multiple database technologies
- Cross-service queries become more complex
- Need for multiple database administration skills
- Data consistency challenges across different database systems
- Backup and disaster recovery complexity

**Mitigation:**
- Implement robust monitoring for all database technologies
- Use event-driven architecture for data synchronisation
- Establish clear data ownership boundaries
- Invest in database administration training and tooling
