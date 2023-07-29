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
    
    @objc dynamic var wallet: Wallet?
    
    @objc dynamic var totalAmount: String = ""
            
    convenience init(id: String, type: OperationType, category: Category, wallet: Wallet, totalAmount: String) {
        self.init()
        self.id = id
        self.type = type
        self.category = category
        self.wallet = wallet
        self.totalAmount = totalAmount
    }
}
