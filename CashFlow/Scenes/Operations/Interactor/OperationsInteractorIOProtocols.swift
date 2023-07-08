import Foundation

protocol OperationsInteractorInputProtocol {
    func createNew(_ operation: OperationPO)
    func fetchAllOperations()
    func createNew(_ expense: ExpensePO)
    func fetchAllExpenses()
}

protocol OperationsInteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ operations: [OperationPO])
    func reloadDataWith(_ expenses: [ExpensePO])

}
