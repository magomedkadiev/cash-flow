import Foundation
import RealmSwift

class Operation: Object {
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var typeRaw: String = ""
    
    var type: OperationType {
        get {
            return OperationType(rawValue: typeRaw) ?? OperationType.expense
        }
        set {
            typeRaw = newValue.rawValue
        }
    }
    
    @objc dynamic var category: Category?
        
    @objc dynamic var totalAmount: String = ""
    
    @objc dynamic var date: Date?
            
    convenience init(id: String, type: OperationType, category: Category, totalAmount: String, date: Date) {
        self.init()
        self.id = id
        self.type = type
        self.category = category
        self.totalAmount = totalAmount
        self.date = date
    }
}
