import Foundation
import Realm
import RealmSwift

class CategoriesTemplate {
    
    class func defaultsCategories() -> [Category] {
        return [
            Category(id: UUID().uuidString, name: "Продукты питания", subCategories: [
                Category(id: UUID().uuidString, name: "Супермаркет", subCategories: []),
                Category(id: UUID().uuidString, name: "Сладости", subCategories: [])

            ]),
            Category(id: UUID().uuidString, name: "Еда вне дома", subCategories: [
                Category(id: UUID().uuidString, name: "Кофейни", subCategories: []),
                Category(id: UUID().uuidString, name: "Рестораны", subCategories: []),
                Category(id: UUID().uuidString, name: "Завтраки", subCategories: []),
                Category(id: UUID().uuidString, name: "Обеды", subCategories: []),
                Category(id: UUID().uuidString, name: "Ужины", subCategories: [])

            ]),
            Category(id: UUID().uuidString, name: "Автомобиль", subCategories: [
                Category(id: UUID().uuidString, name: "Топливо", subCategories: []),
                Category(id: UUID().uuidString, name: "Мойка", subCategories: []),
                Category(id: UUID().uuidString, name: "Штрафы", subCategories: []),
                Category(id: UUID().uuidString, name: "Запчасти", subCategories: [])
            ]),
            Category(id: UUID().uuidString, name: "Услуги связи", subCategories: [
                Category(id: UUID().uuidString, name: "Интернет", subCategories: []),
                Category(id: UUID().uuidString, name: "Мобильная связь", subCategories: [])
            ])
        ]
    }
    
}
