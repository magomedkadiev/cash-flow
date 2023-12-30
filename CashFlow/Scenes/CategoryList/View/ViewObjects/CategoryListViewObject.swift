import Foundation

struct CategoryListViewObject: CashFlowTableViewCellViewObject, Hashable {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "categoryTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = .categoryButton
    
    var name: String
    
    var isExpanded: Bool = true
    
    var subCategories: [CategoryListViewObject] = []
    
    var isSelected: Bool = false
    
    var parentID: String = ""
    
    var id: String = ""
}
