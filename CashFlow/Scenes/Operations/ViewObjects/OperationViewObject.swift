import Foundation

struct OperationViewObject: CashFlowTableViewCellViewObject {
    
    var id: String = ""
    
    var cellHeight: CGFloat = 55
    
    var reuseIdentifier: String = "OperationsTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    
    var categoryName: String
        
    var totalAmount: Int
    
    var date: Date = Date()
    
    var type: OperationType
    
    var comment: String
}

extension OperationViewObject: Comparable {
    static func < (lhs: OperationViewObject, rhs: OperationViewObject) -> Bool {
        lhs.date < rhs.date
    }
}
