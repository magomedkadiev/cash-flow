import Foundation

struct OperationCreationWalletCategoryViewObject: CashFlowTableViewCellViewObject {
    
    var cellHeight: CGFloat {
        return 50
    }
    var reuseIdentifier: String = "OperationCreationWalletCategoryTableViewCell"
    var sectionItem: Int
}
