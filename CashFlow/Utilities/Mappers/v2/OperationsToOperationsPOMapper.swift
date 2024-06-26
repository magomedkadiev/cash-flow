import Foundation

class OperationsToOperationsPOMapper: OperationsToOperationsPOMapperProtocol {
    
    func map(_ operations: [Operation]) -> [OperationPO] {
        var plainObjects = [OperationPO]()
        
        for operation in operations {
            let categoryPO = CategoryPO(id: operation.category?.id ?? "",
                                        name: operation.category?.name ?? "(Без категории)",
                                        subCategories: [])
            let object = OperationPO(id: operation.id,
                                     type: operation.type,
                                     category: categoryPO,
                                     sum: operation.totalAmount,
                                     date: operation.date ?? Date(),
                                     comment: operation.comment)
            plainObjects.append(object)
        }
        return plainObjects
    }
}

protocol OperationsToOperationsPOMapperProtocol {
    func map(_ operations: [Operation]) -> [OperationPO]
}
