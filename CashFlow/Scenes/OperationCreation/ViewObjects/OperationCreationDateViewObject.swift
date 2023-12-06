import Foundation

struct OperationCreationDateViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "dateTableViewCell"
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    var date: Date
}
