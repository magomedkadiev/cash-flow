import Foundation

struct CategoryListViewObject: CashFlowTableViewCellViewObject, Hashable {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "categoryTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = .categoryButton
    
    var id: String = ""

    var parentID: String = ""

    var name: String
    
    var isExpanded: Bool = true
    
    var subCategories: [CategoryListViewObject] = []
    
    var opened: Bool = false
    
    
}
