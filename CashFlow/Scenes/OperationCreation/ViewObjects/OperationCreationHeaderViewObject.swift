import Foundation

struct OperationCreationHeaderViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 47
    }
    var reuseIdentifier: String = "headerTableViewCell"
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    var type: OperationType
}
