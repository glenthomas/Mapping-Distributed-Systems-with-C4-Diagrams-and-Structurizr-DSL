workspace extends ../landscape.dsl {
    model {
        !include model.dsl
    }

    views {
        systemContext supportSystem "SupportSystemContext" {
            include *
            autoLayout
            title "Support System - System Context"
            description "The system context diagram for the Customer Support Platform"
        }

        container supportSystem "SupportContainers" {
            include *
            autoLayout
            title "Support System - Containers"
            description "The container diagram for the Customer Support Platform"
        }

        !include ../styles.dsl
    }
}
