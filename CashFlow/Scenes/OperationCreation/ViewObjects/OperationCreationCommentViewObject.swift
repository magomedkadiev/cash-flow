import Foundation

struct OperationCreationCommentViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat = 50
    
    var reuseIdentifier: String = "commentTableViewCell"
    
    var cellType: CashFlowTableViewCellTypeProtocol = ._default
    
    var comment: String
}
