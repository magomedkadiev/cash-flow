import Foundation

struct OperationPO {
    var id: String
    var type: OperationType
    var category: CategoryPO
    var sum: Int
    var date: Date
    var comment: String
}

enum OperationType: String {
    case expense
    case income
}
