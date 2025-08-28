workspace extends ../workspace.dsl {
    model {
        !include model.dsl
    }

    views {
        systemContext recommendationEngine "RecommendationEngineContext" {
            include *
            autoLayout
            title "Recommendation Engine - System Context"
            description "The system context diagram for the AI-powered Recommendation Engine"
        }

        container recommendationEngine "RecommendationContainers" {
            include *
            autoLayout
            title "Recommendation Engine - Containers"
            description "The container diagram for the Recommendation Engine"
        }

        component recommendationAPI "RecommendationAPIComponents" {
            include *
            autoLayout
            title "Recommendation API - Components"
            description "The component diagram for the Recommendation API"
        }

        component modelTrainingService "ModelTrainingComponents" {
            include *
            autoLayout
            title "Model Training Service - Components"
            description "The component diagram for the Model Training Service"
        }

        !include ../styles.dsl
    }
}
