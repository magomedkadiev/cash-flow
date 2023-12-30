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
}

protocol CategoryToCategoryPOMapperProtocol {
    func map(_ categories: [Category]) -> [CategoryPO]
}
