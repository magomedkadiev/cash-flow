import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad()
}
