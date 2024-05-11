import Foundation

protocol CategoryParentListSelectionHandler: AnyObject {
    func didSelect(_ viewObject: CashFlowTableViewCellViewObject)
}

protocol CategoryParentListCloseHandler: AnyObject {
    func didClose()
}
