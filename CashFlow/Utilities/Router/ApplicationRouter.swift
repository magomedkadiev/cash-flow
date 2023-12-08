import Foundation

protocol ApplicationRouter {
    func openCategoryList()
    func openOperationCreationScreen(_ viewObject: CashFlowTableViewCellViewObject?)
    func dismiss()
}
