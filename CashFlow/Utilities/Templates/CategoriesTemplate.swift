import Foundation
import Realm
import RealmSwift

class CategoriesTemplate {
    
    class func defaultsCategories() -> [Category] {
        return [
            Category(id: "1", name: "Продукты питания", parentID: "", subCategories: [
                Category(id: UUID().uuidString, name: "Супермаркет", parentID: "1", subCategories: []),
                Category(id: UUID().uuidString, name: "Сладости", parentID: "1", subCategories: [])

            ]),
            Category(id: "2", name: "Еда вне дома", parentID: "", subCategories: [
                Category(id: UUID().uuidString, name: "Кофейни", parentID: "2", subCategories: []),
                Category(id: UUID().uuidString, name: "Рестораны", parentID: "2", subCategories: []),
                Category(id: UUID().uuidString, name: "Завтраки", parentID: "2", subCategories: []),
                Category(id: UUID().uuidString, name: "Обеды", parentID: "2", subCategories: []),
                Category(id: UUID().uuidString, name: "Ужины", parentID: "2", subCategories: [])

            ]),
            Category(id: "3", name: "Автомобиль", parentID: "", subCategories: [
                Category(id: UUID().uuidString, name: "Топливо", parentID: "3", subCategories: []),
                Category(id: UUID().uuidString, name: "Мойка", parentID: "3", subCategories: []),
                Category(id: UUID().uuidString, name: "Штрафы", parentID: "3", subCategories: []),
                Category(id: UUID().uuidString, name: "Запчасти", parentID: "3", subCategories: [])
            ]),
            Category(id: "4", name: "Услуги связи", parentID: "", subCategories: [
                Category(id: UUID().uuidString, name: "Интернет", parentID: "4", subCategories: []),
                Category(id: UUID().uuidString, name: "Мобильная связь", parentID: "4", subCategories: [])
            ])
        ]
    }
    
}
