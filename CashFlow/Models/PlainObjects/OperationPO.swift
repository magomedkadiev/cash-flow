import Foundation

struct OperationPO {
    var id: String
    var type: String // create type
    var category: String // create category
    var wallet: String // create wallet
    var data: Data
    var comment: String
    var sum: String
    var expenses: [ExpensePO]
}
