workspace extends landscape.dsl {
    !identifiers hierarchical

    model {
        !include ecommerceSystem/model.dsl
        !include fulfilmentSystem/model.dsl
        !include marketingSystem/model.dsl
        !include supportSystem/model.dsl
        !include searchService/model.dsl
        !include recommendationEngine/model.dsl
    }
}
