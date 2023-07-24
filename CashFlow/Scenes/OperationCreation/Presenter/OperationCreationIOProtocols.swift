import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad()
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject, storedViewObjects: [CashFlowTableViewCellViewObject])
}
