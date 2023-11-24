import Foundation

class OperationsPOToOperationViewObjectsMapper: OperationsPOToOperationViewObjectsMapperProtocol {
    
    func map(_ operationsPO: [OperationPO]) -> [OperationViewObject] {
        
        var plainObjects = [OperationViewObject]()
        for operationPO in operationsPO {
            let plainObject = OperationViewObject(categoryName: operationPO.category.name, totalAmount: operationPO.sum, date: operationPO.date)
            plainObjects.append(plainObject)
        }
        return plainObjects
    }
}

protocol OperationsPOToOperationViewObjectsMapperProtocol {
    func map(_ operationsPO: [OperationPO]) -> [OperationViewObject]
}
