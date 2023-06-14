import Foundation

protocol OperationsInteractorInputProtocol {
    func createNewOperation(_ operation: OperationPO)
    func fetchAllOperations()
}

protocol OperationsInteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ operations: [OperationPO])
}
