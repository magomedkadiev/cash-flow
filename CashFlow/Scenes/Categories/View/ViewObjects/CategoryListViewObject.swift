import Foundation

// TODO: удалить
struct CategoryListViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "categoryTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    
    var name: String
    
}
