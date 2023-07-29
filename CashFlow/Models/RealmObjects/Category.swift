import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var name: String = ""
    
    convenience init(id: String, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
        
}
