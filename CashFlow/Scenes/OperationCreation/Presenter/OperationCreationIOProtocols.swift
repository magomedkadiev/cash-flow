import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObject: [CashFlowTableViewCellViewObject])
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad()
}
