import Foundation

class CategoryPOToRealmCategoryMapper {
    
    func map(_ categoryPO: CategoryPO) -> Category {
        let mappedCategory = Category(id: categoryPO.id, name: categoryPO.name, parentID: "")
        return mappedCategory
    }
}
