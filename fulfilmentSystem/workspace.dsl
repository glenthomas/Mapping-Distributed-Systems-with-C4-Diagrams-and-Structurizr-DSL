workspace extends ../landscape.dsl {
    model {
        !include model.dsl
    }
    
    views {
        systemContext fulfilmentSystem "SystemContext" {
            include *
            autoLayout
        }
        
        container fulfilmentSystem "Containers" {
            include *
            autoLayout
        }
        
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Database" {
                shape cylinder
            }
        }
    }
}
