workspace extends ../workspace.dsl {
    model {
        !include model.dsl
    }

    views {
        systemContext marketingSystem "SystemContext" {
            include *
            autoLayout
        }

        container marketingSystem "Containers" {
            include *
            autoLayout
        }

        !include ../styles.dsl
    }
}
