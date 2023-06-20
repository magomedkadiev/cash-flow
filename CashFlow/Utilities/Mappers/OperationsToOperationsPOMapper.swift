import Foundation

class OperationsToOperationsPOMapper: OperationsToOperationsPOMapperProtocol {
    func map(_ operations: [Operation]) -> [OperationPO] {
        var plainObjects = [OperationPO]()
        for operation in operations {
            let object = OperationPO(id: operation.id, type: "", category: "", wallet: "", data: Data(), comment: "", sum: "")
            plainObjects.append(object)
        }
        return plainObjects
    }
}

protocol OperationsToOperationsPOMapperProtocol {
    func map(_ operations: [Operation]) -> [OperationPO]
}
