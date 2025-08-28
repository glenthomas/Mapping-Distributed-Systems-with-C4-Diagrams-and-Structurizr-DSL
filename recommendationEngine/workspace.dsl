workspace extends ../landscape.dsl {
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

        !include ../styles.dsl
    }
}
