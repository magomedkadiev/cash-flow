import Foundation

struct OperationCreationDateViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "dateTableViewCell"
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    var date: Date
}
