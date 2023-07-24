import Foundation

struct WalletListViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50.0
    
    var reuseIdentifier: String = "WalletListTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    
}
