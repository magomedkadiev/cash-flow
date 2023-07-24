import Foundation

protocol ApplicationRouter {
    func openCategoryList()
    func openOperationCreationScreen()
    func dismissCategoryListViewController(_ viewObject: CashFlowTableViewCellViewObject)
}
