import Foundation
import RealmSwift


class CategoryList: Object {
    
    @objc dynamic var id: Int = 0

    var categories = List<Category>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Category: Object {
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var name: String = ""
    
    var subCategories = List<Category>()

    convenience init(id: String, name: String, subCategories: [Category]) {
        self.init()
        self.id = id
        self.name = name
        self.subCategories.append(objectsIn: subCategories)
    }
}

