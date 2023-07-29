import Foundation
import RealmSwift

class Wallet: Object {
    
    @objc dynamic var id: String = ""
    
    @objc dynamic var name: String = ""
    
    @objc dynamic var sum: String = ""
      
    convenience init(id: String, name: String, sum: String) {
        self.init()
        self.id = id
        self.name = name
        self.sum = sum
    }
}
