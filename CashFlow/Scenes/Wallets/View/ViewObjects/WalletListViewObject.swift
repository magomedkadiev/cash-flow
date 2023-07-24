import Foundation

struct WalletListViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50.0
    
    var reuseIdentifier: String = "OperationCreationWalletCategoryTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    
    var name: String
}
