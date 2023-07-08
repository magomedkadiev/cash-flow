import Foundation

class ExpensesToExpensesPOMapper: ExpensesToExpensesPOMapperProtocol {
    func map(_ expenses: [Expense]) -> [ExpensePO] {
        var plainObjects = [ExpensePO]()
        for expense in expenses {
            let plainObject = ExpensePO(id: expense.id, name: expense.name, totalValue: expense.totalValue)
            plainObjects.append(plainObject)
        }
        return plainObjects
    }
}

protocol ExpensesToExpensesPOMapperProtocol {
    func map(_ expenses: [Expense]) -> [ExpensePO]
}
