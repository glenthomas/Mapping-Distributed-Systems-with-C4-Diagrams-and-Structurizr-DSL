workspace extends ../workspace.dsl {
    model{
        !includes model.dsl
    }
    
    views {
        systemContext ecommerceSystem "SystemContext" {
            include *
            autoLayout
        }
        
        container ecommerceSystem "Containers" {
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
