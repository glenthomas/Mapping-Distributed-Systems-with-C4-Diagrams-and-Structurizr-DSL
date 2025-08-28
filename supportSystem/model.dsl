# Define support system people
supportAgent = person "Support Agent" "Customer service representative handling support tickets"
supportManager = person "Support Manager" "Manages support operations and team performance"

# Redefine supportSystem as the internal system (overrides the external system definition)
!element supportSystem {
    # Container level - microservices
    supportPortal = container "Support Portal" "Customer-facing support interface" "React/JavaScript"
    agentDashboard = container "Agent Dashboard" "Support agent interface for managing tickets" "React/JavaScript"
    apiGateway = container "API Gateway" "Entry point for all API requests" "Spring Cloud Gateway"
    
    ticketService = container "Ticket Service" "Manages support tickets and workflow" "Spring Boot/Java"
    knowledgeBaseService = container "Knowledge Base Service" "Manages help articles and FAQs" "Node.js/Express"
    chatService = container "Live Chat Service" "Handles real-time customer chat" "Node.js/Socket.io"
    notificationService = container "Notification Service" "Sends support-related notifications" "Python/FastAPI"
    reportingService = container "Reporting Service" "Generates support analytics and reports" "Python/FastAPI"
    
    ticketDatabase = container "Ticket Database" "Stores support tickets and interactions" "PostgreSQL" {
        tags "Database"
    }
    knowledgeBaseDatabase = container "Knowledge Base Database" "Stores help articles and documentation" "MongoDB" {
        tags "Database"
    }
    chatDatabase = container "Chat Database" "Stores chat conversations and history" "Redis" {
        tags "Database"
    }
    
    messageQueue = container "Message Queue" "Handles asynchronous communication" "Apache Kafka"

    # Define relationships at the container level
    customer -> supportPortal "Uses for support requests"
    supportAgent -> agentDashboard "Uses to manage support tickets"
    supportManager -> reportingService "Uses to view support analytics"
    
    supportPortal -> apiGateway "Makes API calls to"
    agentDashboard -> apiGateway "Makes API calls to"
    
    apiGateway -> ticketService "Routes requests to"
    apiGateway -> knowledgeBaseService "Routes requests to"
    apiGateway -> chatService "Routes requests to"
    apiGateway -> reportingService "Routes requests to"
    
    ticketService -> ticketDatabase "Reads from and writes to"
    knowledgeBaseService -> knowledgeBaseDatabase "Reads from and writes to"
    chatService -> chatDatabase "Reads from and writes to"
    reportingService -> ticketDatabase "Reads analytics data from"
    
    ticketService -> notificationService "Triggers ticket notifications via"
    chatService -> notificationService "Triggers chat notifications via"
    notificationService -> emailService "Sends emails via"
    notificationService -> messageQueue "Publishes notification events to"
    
    ticketService -> messageQueue "Publishes ticket events to"
    chatService -> messageQueue "Publishes chat events to"
    
    # Integration with other systems
    ticketService -> ecommerceSystem "Retrieves customer and order data from"
    ticketService -> crmSystem "Updates customer support history in"
    reportingService -> analyticsSystem "Sends support metrics to"
}
