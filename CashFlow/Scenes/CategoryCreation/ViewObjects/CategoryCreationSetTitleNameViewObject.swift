import Foundation

struct CategoryCreationSetTitleNameViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "CategoryCreationSetTitleNameCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = .categoryCreationSetTitleName
    
    var titleName: String
    
}
