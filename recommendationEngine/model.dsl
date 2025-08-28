# Define recommendation engine people
dataScientist = person "Data Scientist" "Develops and optimizes recommendation algorithms"
mlEngineer = person "ML Engineer" "Maintains and monitors machine learning models"

# Redefine recommendationEngine as the internal system (overrides the external system definition)
!element recommendationEngine {
    # Container level - microservices
    recommendationAPI = container "Recommendation API" "Serves personalized recommendations" "Python/FastAPI"
    modelTrainingService = container "Model Training Service" "Trains and updates ML models" "Python/MLflow"
    dataProcessingService = container "Data Processing Service" "Processes user behavior and product data" "Apache Spark/Python"
    featureStore = container "Feature Store" "Manages ML features for recommendations" "Python/Feast"
    modelServingService = container "Model Serving Service" "Hosts and serves ML models" "Python/TensorFlow Serving"
    abTestingService = container "A/B Testing Service" "Manages recommendation experiments" "Python/FastAPI"
    
    # ML and data infrastructure
    modelStorage = container "Model Storage" "Stores trained ML models and artifacts" "MinIO/S3" {
        tags "Database"
    }
    featureDatabase = container "Feature Database" "Stores user and product features" "PostgreSQL" {
        tags "Database"
    }
    behaviorDataLake = container "Behavior Data Lake" "Stores raw user interaction data" "Apache Parquet/S3" {
        tags "Database"
    }
    modelMetricsDatabase = container "Model Metrics Database" "Stores model performance metrics" "InfluxDB" {
        tags "Database"
    }
    
    messageQueue = container "Message Queue" "Handles real-time user events" "Apache Kafka"

    # Define relationships at the container level
    customer -> recommendationAPI "Gets personalized recommendations from" 
    dataScientist -> modelTrainingService "Develops models with"
    mlEngineer -> modelServingService "Monitors models using"
    mlEngineer -> abTestingService "Manages experiments with"
    
    # Internal service relationships
    recommendationAPI -> modelServingService "Gets predictions from"
    recommendationAPI -> featureStore "Retrieves user features from"
    recommendationAPI -> abTestingService "Gets experiment configuration from"
    
    modelTrainingService -> behaviorDataLake "Trains on historical data from"
    modelTrainingService -> featureStore "Uses features from"
    modelTrainingService -> modelStorage "Stores trained models in"
    
    dataProcessingService -> behaviorDataLake "Processes raw data into"
    dataProcessingService -> featureStore "Updates features in"
    dataProcessingService -> messageQueue "Consumes user events from"
    
    modelServingService -> modelStorage "Loads models from"
    modelServingService -> modelMetricsDatabase "Logs performance metrics to"
    
    featureStore -> featureDatabase "Stores features in"
    abTestingService -> modelMetricsDatabase "Tracks experiment results in"
    
    # Integration with other systems
    dataProcessingService -> ecommerceSystem "Ingests user behavior from"
    recommendationAPI -> ecommerceSystem "Gets product information from"
    dataProcessingService -> analyticsSystem "Sends recommendation metrics to"
    recommendationAPI -> searchService "Enhances search results for"
}
