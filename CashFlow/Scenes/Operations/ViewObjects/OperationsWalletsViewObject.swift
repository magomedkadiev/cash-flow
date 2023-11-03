import Foundation

struct OperationsWalletsViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 70
    var reuseIdentifier: String = "OperationsWalletsTableViewCell"
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
}
