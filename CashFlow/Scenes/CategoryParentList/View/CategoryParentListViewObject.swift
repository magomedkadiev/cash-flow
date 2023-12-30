import Foundation

struct CategoryParentListViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "CategoryParentListCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    
    var parentID: String
    
    var name: String
    
}
