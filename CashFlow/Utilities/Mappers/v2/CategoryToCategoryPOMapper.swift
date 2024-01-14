import Foundation

class CategoryToCategoryPOMapper: CategoryToCategoryPOMapperProtocol {
    
    func map(_ categories: [Category]) -> [CategoryPO] {
        var plainObjects = [CategoryPO]()
        
        for category in categories {
            let plainObject = CategoryPO(id: category.id, name: category.name, parentID: category.parentID, subCategories: [])
            plainObjects.append(plainObject)
        }
        
        return plainObjects
    }
    
    func map(_ viewObject: CashFlowTableViewCellViewObject) -> Category {
        guard let viewObject = viewObject as? CategoryListViewObject else {
            return Category()
        }
        return Category(id: viewObject.id, name: viewObject.name, parentID: viewObject.parentID)
    }
}

protocol CategoryToCategoryPOMapperProtocol {
    func map(_ categories: [Category]) -> [CategoryPO]
    func map(_ viewObject: CashFlowTableViewCellViewObject) -> Category
}
