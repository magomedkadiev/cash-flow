import Foundation

struct OperationsWalletsViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    var reuseIdentifier: String = "OperationsWalletsTableViewCell"
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
}
