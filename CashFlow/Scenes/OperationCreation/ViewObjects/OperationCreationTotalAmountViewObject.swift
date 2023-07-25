import Foundation

struct OperationCreationTotalAmountViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 76
    
    var reuseIdentifier: String = "TotalAmountTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    
    var defaultTextValue = "0 ₽" 

}
