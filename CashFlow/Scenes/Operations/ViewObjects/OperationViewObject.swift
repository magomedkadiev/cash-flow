import Foundation

struct OperationViewObject: CashFlowTableViewCellViewObject {
    var cellHeight: CGFloat = 55
    
    var reuseIdentifier: String = "OperationsTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    
    var categoryName: String
        
    var totalAmount: Int
    
    var date: Date = Date()
    
    var type: OperationType
}

extension OperationViewObject: Comparable {
    static func < (lhs: OperationViewObject, rhs: OperationViewObject) -> Bool {
        lhs.date < rhs.date
    }
}
