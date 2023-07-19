import Foundation

protocol OperationsInputViewProtocol: AnyObject {
//    func refreshTableView(operations: [OperationPO])
//    func refreshTableView(expenses: [ExpensePO])
}

protocol OperationsOutputViewProtocol {
    func viewDidLoad()
    func createNewExpenseButtonTappedWith(expenseName: String)
}
