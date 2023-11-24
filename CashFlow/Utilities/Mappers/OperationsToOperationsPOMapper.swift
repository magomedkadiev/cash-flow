import Foundation

class OperationsToOperationsPOMapper: OperationsToOperationsPOMapperProtocol {
    
    func map(_ operations: [Operation]) -> [OperationPO] {
        var plainObjects = [OperationPO]()
        
        for operation in operations {
            let categoryPO = CategoryPO(id: operation.category?.id ?? "" ,
                                        name: operation.category?.name ?? "")
            let walletPO = WalletPO(id: operation.wallet?.id ?? "",
                                    name: operation.wallet?.name ?? "",
                                    sum: operation.wallet?.sum ?? "")
            
            let object = OperationPO(id: operation.id,
                                     type: operation.type,
                                     category: categoryPO,
                                     wallet: walletPO,
                                     sum: operation.totalAmount,
                                     date: operation.date ?? Date(), comment: "")
            plainObjects.append(object)
        }
        return plainObjects
    }
}

protocol OperationsToOperationsPOMapperProtocol {
    func map(_ operations: [Operation]) -> [OperationPO]
}
