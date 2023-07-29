import Foundation

protocol OperationsInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
}

protocol OperationsOutputViewProtocol {
    func viewDidLoad()
    func fetchAllOperations()
}
