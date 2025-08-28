workspace "Retail Business" "Architecture for our online retail business" {
    !identifiers hierarchical

    model {
        # Define people and external systems
        customer = person "Customer" "A customer of our e-commerce platform"
        
        emailService = softwareSystem "Email Service" "External email delivery service" {
            tags "External"
        }
        
        ecommerceSystem = softwareSystem "E-commerce Platform" "Core e-commerce functionality"
        fulfilmentSystem = softwareSystem "Fulfilment Platform" "Order fulfilment system"
        marketingSystem = softwareSystem "Marketing Automation" "Manages campaigns and customer engagement"
        crmSystem = softwareSystem "CRM System" "Customer relationship management platform"
        analyticsSystem = softwareSystem "Analytics Platform" "Aggregates and analyzes business data"
        recommendationEngine = softwareSystem "Recommendation Engine" "Provides personalized product recommendations"
        searchService = softwareSystem "Search Service" "Enables product search functionality"
        supportSystem = softwareSystem "Customer Support Platform" "Handles customer inquiries and support operations"
    }

    views {
        !include styles.dsl
    }

    !adrs docs/architecture-decision-records
}