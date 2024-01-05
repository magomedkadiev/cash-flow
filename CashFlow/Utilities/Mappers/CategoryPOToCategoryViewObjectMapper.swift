import Foundation

class CategoryPOToCategoryViewObjectMapper: CategoryPOToCategoryViewObjectMapperProtocol {
    
    func map(_ operationsPO: [CategoryPO]) -> [CategoryListViewObject] {
        var viewObjects = [CategoryListViewObject]()
        for operationPO in operationsPO {
            let viewObject = CategoryListViewObject(name: operationPO.name, parentID: operationPO.parentID, id: operationPO.id)
            viewObjects.append(viewObject)
        }
        return viewObjects
    }
}

protocol CategoryPOToCategoryViewObjectMapperProtocol {
    func map(_ operationsPO: [CategoryPO]) -> [CategoryListViewObject]
}
