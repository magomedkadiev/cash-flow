import Foundation

struct CategoryListViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "CategoryListTableViewCell"
    
    var selectedRowType: CashFlowTableViewCellTypeProtocol = ._default
    
}
