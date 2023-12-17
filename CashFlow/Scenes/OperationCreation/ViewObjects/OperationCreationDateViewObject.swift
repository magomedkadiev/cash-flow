import Foundation

struct OperationCreationDateViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "dateTableViewCell"
    var date: Date
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
}

