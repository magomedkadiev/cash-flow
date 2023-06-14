import Foundation

protocol OperationsInputViewProtocol: AnyObject {
    func refreshTableView(operations: [OperationPO])
}

protocol OperationsOutputViewProtocol {
    func viewDidLoad()
    func addNewOperationButtonTapped(_ tag: Int)
}
