import Foundation
import RealmSwift

protocol RealmManagerProtocol {
    
    func write(_ writeOperation: @escaping (_ realm: Realm) -> Void, onSuccess: (() -> Void)?, onFailure: (() -> Void)?)
}
