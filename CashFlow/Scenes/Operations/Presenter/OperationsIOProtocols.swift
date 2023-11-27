import Foundation

protocol OperationsInputViewProtocol: AnyObject {
    func showInfo(_ operationSectionObjects: [OperationSectionObject], totalExpense: Int, totalIncome: Int)
}

protocol OperationsOutputViewProtocol {
    func viewDidLoad()
    func fetchAllOperations()
    func eventBeginFerfeshing()
}
