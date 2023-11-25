import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
    func operationCreationFinished()
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad()
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject, sum: String, type: OperationType)
    func configureSelected(viewObject: CashFlowTableViewCellViewObject)
}
