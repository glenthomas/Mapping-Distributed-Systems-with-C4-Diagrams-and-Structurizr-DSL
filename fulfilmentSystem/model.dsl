shippingProvider = softwareSystem "Shipping Provider" "External shipping and logistics integration" {
    tags "External"
}

!element fulfilmentSystem {
    orderManagement = container "Order Management Service" "Handles order intake, validation, and tracking" "Spring Boot/Java"
    inventoryService = container "Inventory Service" "Manages stock levels and reservations" "Node.js/Express"
    warehouseService = container "Warehouse Service" "Coordinates picking, packing, and shipping" "Python/FastAPI"
    shippingService = container "Shipping Service" "Integrates with carriers and manages shipments" "Go"
    notificationService = container "Notification Service" "Sends order and shipping notifications" "Node.js"
    
    orderDatabase = container "Order Database" "Stores order data" "PostgreSQL" {
        tags "Database"
    }
    inventoryDatabase = container "Inventory Database" "Stores inventory data" "MongoDB" {
        tags "Database"
    }
    warehouseDatabase = container "Warehouse Database" "Stores warehouse operations data" "MySQL" {
        tags "Database"
    }
    
    messageQueue = container "Message Queue" "Handles asynchronous events" "RabbitMQ"
    
    # Relationships
    #salesChannel -> orderManagement "Places orders via"
    orderManagement -> orderDatabase "Reads from and writes to"
    orderManagement -> inventoryService "Checks and reserves stock"
    orderManagement -> notificationService "Triggers order confirmation"
    orderManagement -> messageQueue "Publishes order events"
    
    inventoryService -> inventoryDatabase "Reads from and writes to"
    inventoryService -> messageQueue "Publishes inventory events"
    
    warehouseService -> warehouseDatabase "Reads from and writes to"
    warehouseService -> inventoryService "Updates inventory after fulfilment"
    warehouseService -> shippingService "Requests shipment"
    warehouseService -> messageQueue "Publishes fulfilment events"
    
    shippingService -> shippingProvider "Integrates with carriers via"
    shippingService -> messageQueue "Publishes shipping events"
    shippingService -> notificationService "Triggers shipping notifications"
    
    notificationService -> messageQueue "Consumes events"
    notificationService -> emailService "Sends emails"
}