# Define search service people
searchAnalyst = person "Search Analyst" "Analyzes search patterns and optimizes search experience"
merchandiser = person "Merchandiser" "Manages product visibility and search rankings"

!element searchService {
    # Container level - microservices
    searchAPI = container "Search API" "Primary search interface and orchestration" "Spring Boot/Java"
    indexingService = container "Indexing Service" "Processes and indexes product data" "Python/FastAPI"
    queryProcessor = container "Query Processor" "Analyzes and enhances search queries" "Python/FastAPI"
    autocompleteService = container "Autocomplete Service" "Provides search suggestions and autocompletion" "Node.js/Express"
    searchAnalytics = container "Search Analytics" "Tracks search behavior and performance" "Python/FastAPI"
    facetService = container "Facet Service" "Manages search filters and faceted navigation" "Spring Boot/Java"
    
    # Search infrastructure
    searchIndex = container "Search Index" "Elasticsearch cluster for product search" "Elasticsearch" {
        tags "Database"
    }
    searchCache = container "Search Cache" "Caches frequent searches and results" "Redis" {
        tags "Database"
    }
    analyticsDatabase = container "Analytics Database" "Stores search analytics and metrics" "PostgreSQL" {
        tags "Database"
    }
    
    messageQueue = container "Message Queue" "Handles asynchronous data updates" "Apache Kafka"

    # Define relationships at the container level
    customer -> searchAPI "Searches for products via"
    merchandiser -> searchAnalytics "Analyzes search performance with"
    searchAnalyst -> searchAnalytics "Optimizes search experience using"
    
    # Internal service relationships
    searchAPI -> queryProcessor "Processes queries with"
    searchAPI -> searchIndex "Queries products from"
    searchAPI -> searchCache "Checks cached results in"
    searchAPI -> facetService "Gets filters and facets from"
    
    queryProcessor -> autocompleteService "Gets suggestions from"
    queryProcessor -> searchIndex "Performs enhanced queries on"
    
    indexingService -> searchIndex "Maintains product index in"
    indexingService -> messageQueue "Consumes product updates from"
    
    searchAPI -> searchAnalytics "Logs search events to"
    searchAnalytics -> analyticsDatabase "Stores metrics in"
    
    facetService -> searchIndex "Retrieves facet data from"
    autocompleteService -> searchCache "Caches suggestions in"
    
    # Integration with other systems
    indexingService -> ecommerceSystem "Syncs product catalog from"
    searchAnalytics -> analyticsSystem "Sends search metrics to"
    searchAPI -> recommendationEngine "Gets personalized results from"
}
