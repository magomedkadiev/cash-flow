import Foundation

struct OperationPO {
    var id: String
    var type: OperationType
    var category: OperationCreationCategoryViewObject
    var wallet: OperationCreationWalletCategoryViewObject
    var data: Data
    var comment: String
}

enum OperationType {
    case expense
    case income
    case transition
}
