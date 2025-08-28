workspace extends ../landscape.dsl {
    model {
        !include model.dsl
    }

    views {
        systemContext searchService "SearchServiceContext" {
            include *
            autoLayout
            title "Search Service - System Context"
            description "The system context diagram for the Product Search Platform"
        }

        container searchService "SearchContainers" {
            include *
            autoLayout
            title "Search Service - Containers"
            description "The container diagram for the Product Search Platform"
        }

        !include ../styles.dsl
    }
}
