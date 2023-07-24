import Foundation

struct OperationCreationCategoryViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "categoryTableViewCell"
    var selectedRowType: CashFlowTableViewCellTypeProtocol = .categoryButton
    var name: String = "Без категории"
}
