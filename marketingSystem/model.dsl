# Define people and external systems
marketer = person "Marketer" "Marketing team member managing campaigns"
analyst = person "Analyst" "Analyzes marketing data and performance"
analyticsProvider = softwareSystem "Analytics Provider" "External analytics and tracking" {
    tags "External"
}

!element marketingSystem {
    # Container level - microservices
    campaignManager = container "Campaign Manager" "Manages marketing campaigns and promotions" "Spring Boot/Java"
    segmentationService = container "Segmentation Service" "Segments customers for targeted marketing" "Python/FastAPI"
    emailCampaignService = container "Email Campaign Service" "Schedules and sends marketing emails" "Node.js/Express"
    analyticsService = container "Analytics Service" "Collects and analyzes marketing data" "Python/FastAPI"
    apiGateway = container "API Gateway" "Entry point for all API requests" "Spring Cloud Gateway"

    campaignDatabase = container "Campaign Database" "Stores campaign and promotion data" "PostgreSQL" {
        tags "Database"
    }
    segmentationDatabase = container "Segmentation Database" "Stores customer segments" "MongoDB" {
        tags "Database"
    }
    analyticsDatabase = container "Analytics Database" "Stores marketing analytics data" "PostgreSQL" {
        tags "Database"
    }

    messageQueue = container "Message Queue" "Handles asynchronous communication" "Apache Kafka"

    # Define relationships at the system level
    marketer -> marketingSystem "Manages campaigns with"
    analyst -> marketingSystem "Analyzes data with"
    marketingSystem -> ecommerceSystem "Syncs customer and order data with"
    marketingSystem -> emailService "Sends marketing emails via"
    marketingSystem -> analyticsProvider "Sends tracking data to"

    # Define relationships at the container level
    marketer -> campaignManager "Uses"
    analyst -> analyticsService "Uses"

    campaignManager -> apiGateway "Makes API calls to"
    segmentationService -> apiGateway "Makes API calls to"
    emailCampaignService -> apiGateway "Makes API calls to"
    analyticsService -> apiGateway "Makes API calls to"

    apiGateway -> campaignManager "Routes requests to"
    apiGateway -> segmentationService "Routes requests to"
    apiGateway -> emailCampaignService "Routes requests to"
    apiGateway -> analyticsService "Routes requests to"

    campaignManager -> campaignDatabase "Reads from and writes to"
    segmentationService -> segmentationDatabase "Reads from and writes to"
    analyticsService -> analyticsDatabase "Reads from and writes to"

    campaignManager -> segmentationService "Gets customer segments from"
    campaignManager -> emailCampaignService "Schedules email campaigns via"
    emailCampaignService -> emailService "Sends emails via"
    analyticsService -> analyticsProvider "Sends tracking data to"
    analyticsService -> messageQueue "Publishes events to"
    campaignManager -> messageQueue "Publishes events to"
    segmentationService -> messageQueue "Publishes events to"

    marketingSystem -> ecommerceSystem "Imports customer and order data from"
}