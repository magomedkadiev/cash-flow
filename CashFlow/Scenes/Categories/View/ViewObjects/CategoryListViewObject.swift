import Foundation

struct CategoryListViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "categoryTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = .categoryButton
    
    var name: String
    
    var isExpanded: Bool = true
    
    var subCategories: [CategoryListViewObject] = []
    
    var isSelected: Bool = false
    
}
