import Foundation

class OperationsToOperationsPOMapper: OperationsToOperationsPOMapperProtocol {
    func map(_ operations: [Operation]) -> [OperationPO] {
        let plainObjects = [OperationPO]()
//        for operation in operations {
//            print(operation.expenses)
//            let object = OperationPO(id: operation.id, type: "", category: "", wallet: "", data: Data(), comment: "", sum: "", expenses: [])
//            plainObjects.append(object)
//        }
        return plainObjects
    }
}

protocol OperationsToOperationsPOMapperProtocol {
    func map(_ operations: [Operation]) -> [OperationPO]
}
