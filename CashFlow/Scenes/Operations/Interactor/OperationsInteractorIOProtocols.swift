import Foundation

protocol OperationsInteractorInputProtocol {
    func fetchAllOperations()
}

protocol OperationsInteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ operations: [OperationPO])
}
