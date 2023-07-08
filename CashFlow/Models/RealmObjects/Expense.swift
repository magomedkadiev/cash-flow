import Foundation
import RealmSwift

class Expense: Object {
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var name: String = ""
    
    @objc dynamic var totalValue: Int = 0
    
    convenience init(id: String, name: String, totalValue: Int) {
        self.init()
        self.id = id
        self.name = name
        self.totalValue = totalValue
    }
    
}
