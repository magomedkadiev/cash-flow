import Foundation

class CategoryPOToCategoryViewObjectMapper: CategoryPOToCategoryViewObjectMapperProtocol {
    
    func map(_ categoriesPO: [CategoryPO]) -> [CategoryListViewObject] {
        var viewObjects = [CategoryListViewObject]()
        for categoryPO in categoriesPO {
            var subCategories = [CategoryListViewObject]()
            for subCategory in categoryPO.subCategories {
                let subViewObject = CategoryListViewObject(id: subCategory.id, parentID: subCategory.parentID, name: subCategory.name)
                subCategories.append(subViewObject)
            }
            let viewObject = CategoryListViewObject(id: categoryPO.id, name: categoryPO.name, subCategories: subCategories)
            viewObjects.append(viewObject)
        }
        return viewObjects
    }
}

protocol CategoryPOToCategoryViewObjectMapperProtocol {
    func map(_ categoriesPO: [CategoryPO]) -> [CategoryListViewObject]
}
