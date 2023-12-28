import Foundation

class CategoryToCategoryParentViewObjectMapper: CategoryToCategoryParentViewObjectMapperProtocol {
    
    func map(_ categories: [Category]) -> [CashFlowTableViewCellViewObject] {
        var viewObjects = [CashFlowTableViewCellViewObject]()
        
        for category in categories {
            let viewObject = CategoryParentListViewObject(name: category.name)
            viewObjects.append(viewObject)
        }
        return viewObjects
    }
}

protocol CategoryToCategoryParentViewObjectMapperProtocol {
    func map(_ categories: [Category]) -> [CashFlowTableViewCellViewObject]
}
