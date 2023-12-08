import Foundation

struct OperationCreationTotalAmountViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 76
    
    var reuseIdentifier: String = "TotalAmountTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    
    var totalAmount: Int

}
