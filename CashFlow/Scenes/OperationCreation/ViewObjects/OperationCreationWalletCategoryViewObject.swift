import Foundation

struct OperationCreationWalletCategoryViewObject: CashFlowTableViewCellViewObject {
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "OperationCreationWalletCategoryTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = .walletButton
    
    var name: String
 
}
