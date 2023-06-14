import Foundation

protocol OperationsDAO {
    
    func creationOperation(_ operation: OperationPO, complitionHandler: @escaping () -> Void?)
    func fetchAllOperations() -> [Operation]
}
