import Foundation

protocol ApplicationRouter {
    func openCategoryList()
    func openWalletList()
    func openOperationCreationScreen()
    func dismissCategoryListViewController(_ viewObject: CashFlowTableViewCellViewObject)
    func dismissWalletListViewController(_ viewObject: CashFlowTableViewCellViewObject)
}
