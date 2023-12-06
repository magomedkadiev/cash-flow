import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
    func operationCreationFinished()
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad()
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject, sum: Int, type: OperationType)
    func configureSelected(viewObject: CashFlowTableViewCellViewObject)
    func datePickerValueChanged(date: Date)
}
