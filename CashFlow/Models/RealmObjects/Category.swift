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
    
    @objc dynamic var parentID: String = ""
    
    override static func primaryKey() -> String? {
            return "id"
    }
    
    var subCategories = List<Category>()

    convenience init(id: String, name: String, parentID: String, subCategories: [Category]) {
        self.init()
        self.id = id
        self.name = name
        self.parentID = parentID
        self.subCategories.append(objectsIn: subCategories)
    }
}

