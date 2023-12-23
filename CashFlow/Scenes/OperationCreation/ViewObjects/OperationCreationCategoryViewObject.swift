import Foundation

// DEPRECATED
struct OperationCreationCategoryViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "categoryTableViewCell"
    var cellType: CashFlowTableViewCellTypeProtocol = .categoryButton
    var name: String
}
