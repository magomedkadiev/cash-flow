import Foundation

protocol OperationCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
    func operationCreationFinished()
}

protocol OperationCreationOutputViewProtocol {
    func viewDidLoad(_ viewObject: CashFlowTableViewCellViewObject?)
    func didSelectRowAt(_ type: CashFlowTableViewCellTypeProtocol)
    func configureSelected(viewObject: CashFlowTableViewCellViewObject)
    func datePickerValueChanged(date: Date)
    func totalAmountValueChanged(totalAmount: Int)
    func segmentedControlValueChanged(_ segmentedIndex: Int)
}
