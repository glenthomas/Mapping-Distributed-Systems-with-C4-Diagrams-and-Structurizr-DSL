admin = person "Administrator" "Administrative user managing the platform"

taxService = softwareSystem "Tax Calculation Service" "Handles tax calculations and compliance" {
    tags "External"
}
paymentProvider = softwareSystem "Payment Provider" "External payment processing" {
    tags "External"
}

!element ecommerceSystem {
    webApp = container "Web Application" "Customer-facing web interface" "React/JavaScript"
    adminPanel = container "Admin Panel" "Administrative interface" "React/JavaScript"
    apiGateway = container "API Gateway" "Entry point for all API requests" "Spring Cloud Gateway"
    
    userService = container "User Service" "Manages customer accounts and authentication" "Spring Boot/Java"
    catalogService = container "Catalog Service" "Manages product catalog" "Node.js/Express"
    orderService = container "Order Service" "Handles order processing" "Spring Boot/Java"
    paymentService = container "Payment Service" "Processes payments" "Python/FastAPI"
    
    userDatabase = container "User Database" "Stores user account information" "PostgreSQL" {
        tags "Database"
    }
    catalogDatabase = container "Catalog Database" "Stores product information" "MongoDB" {
        tags "Database"
    }
    orderDatabase = container "Order Database" "Stores order data" "PostgreSQL" {
        tags "Database"
    }
    
    messageQueue = container "Message Queue" "Handles asynchronous communication" "Apache Kafka"

    # Define relationships at the container level
    customer -> webApp "Uses"
    admin -> adminPanel "Uses"
    
    webApp -> apiGateway "Makes API calls to"
    adminPanel -> apiGateway "Makes API calls to"
    
    apiGateway -> userService "Routes requests to"
    apiGateway -> catalogService "Routes requests to"
    apiGateway -> orderService "Routes requests to"
    
    userService -> userDatabase "Reads from and writes to"
    catalogService -> catalogDatabase "Reads from and writes to"
    orderService -> orderDatabase "Reads from and writes to"
    orderService -> paymentService "Initiates payments via"
    orderService -> taxService "Calculates taxes via"
    
    paymentService -> paymentProvider "Processes payments via"
    paymentService -> messageQueue "Publishes events to"
    orderService -> messageQueue "Publishes events to"
    userService -> messageQueue "Publishes events to"
    
    orderService -> emailService "Sends order confirmations via"
}
