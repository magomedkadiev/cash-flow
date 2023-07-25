import Foundation

struct OperationCreationHeaderViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 47
    }
    var reuseIdentifier: String = "headerTableViewCell"
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
}
