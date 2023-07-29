import Foundation

struct OperationPO {
    var id: String
    var type: OperationType
    var category: CategoryPO
    var wallet: WalletPO
    var sum: String
    var data: Data
    var comment: String
}

enum OperationType: String {
    case expense
    case income
    case transition
}
