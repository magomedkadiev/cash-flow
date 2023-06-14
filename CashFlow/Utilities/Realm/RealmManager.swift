import Foundation
import RealmSwift

class RealmManager: RealmManagerProtocol {
    
    static let shared = RealmManager()
    
    private lazy var writeQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.name = "Write queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    func write(_ writeOperation: @escaping (Realm) -> Void, onSuccess: (() -> Void)?, onFailure: (() -> Void)? = nil) {
        writeQueue.addOperation ({
            let realm = try! Realm()
            realm.beginWrite()
            writeOperation(realm)
            do {
                try realm.commitWrite()
                onSuccess?()
            } catch {
                onFailure?()
            }
        })
    }
}
