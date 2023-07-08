import Foundation

protocol OperationsDAO {
    func creationOperation(_ operation: OperationPO, complitionHandler: @escaping () -> Void?)
    func fetchAllOperations() -> [Operation]
    func createNew(_ expense: ExpensePO, complitionHandler: @escaping () -> Void?)
    func fetchAllExpenses() -> [Expense]
}
