import Foundation

struct CategoryCreationParentCategoryViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "CategoryCreationParentCategoryCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    
    var parentCategoryTitleName: String
    
}
