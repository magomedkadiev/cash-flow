import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
    func operationCreationFinished()
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad()
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject, totalAmount: String)
    func configureSelected(viewObject: CashFlowTableViewCellViewObject)
}
