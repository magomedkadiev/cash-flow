import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var name: String = ""
    
    @objc dynamic var parentID: String = ""
    
    convenience init(id: String, name: String, parentID: String) {
        self.init()
        self.id = id
        self.name = name
        self.parentID = parentID
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
        
}
