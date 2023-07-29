import Foundation

struct OperationViewObject: CashFlowTableViewCellViewObject {
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "OperationsTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    
    var categoryName: String
    
    var walletName: String
    
    var totalAmount: String
}
