import Foundation

class CategoryToCategoryParentViewObjectMapper: CategoryToCategoryParentViewObjectMapperProtocol {
    
    func map(_ categories: [CategoryPO]) -> [CashFlowTableViewCellViewObject] {
        var viewObjects = [CashFlowTableViewCellViewObject]()
        
        for category in categories {
            let viewObject = CategoryParentListViewObject(parentID: category.id, name: category.name)
            viewObjects.append(viewObject)
        }
        return viewObjects
    }
}

protocol CategoryToCategoryParentViewObjectMapperProtocol {
    func map(_ categories: [CategoryPO]) -> [CashFlowTableViewCellViewObject]
}
