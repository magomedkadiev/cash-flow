import Foundation

class CategoryToCategoryPOMapper: CategoryToCategoryPOMapperProtocol {
    
    func map(_ categories: [Category]) -> [CategoryPO] {
        var plainObjects = [CategoryPO]()
        
        for category in categories {
            var subCategories = [CategoryPO]()
            
            for sub in category.subCategories {
                let subCategoryPO = CategoryPO(id: sub.id, name: sub.name, subCategories: [])
                subCategories.append(subCategoryPO)
            }
            
            let plainObject = CategoryPO(id: category.id, name: category.name, subCategories: subCategories)
            plainObjects.append(plainObject)
        }
        
        return plainObjects
    }
    
    func map(_ viewObject: CashFlowTableViewCellViewObject) -> Category {
        guard let viewObject = viewObject as? CategoryParentListViewObject else {
            return Category()
        }
        return Category(id: viewObject.id, name: viewObject.name, subCategories: [])
    }
}

protocol CategoryToCategoryPOMapperProtocol {
    func map(_ categories: [Category]) -> [CategoryPO]
    func map(_ viewObject: CashFlowTableViewCellViewObject) -> Category
}
