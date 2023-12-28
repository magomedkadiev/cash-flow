import Foundation

class CategoryToCategoryListViewObjectMapper: CategoryToCategoryListViewObjectMapperProtocol {
    func map(_ categories: [Category]) -> [CashFlowTableViewCellViewObject] {
        var viewObjects = [CashFlowTableViewCellViewObject]()
        
        for category in categories {
            let viewObject = CategoryListViewObject(name: category.name)
            viewObjects.append(viewObject)
        }
        return viewObjects

    }
}

protocol CategoryToCategoryListViewObjectMapperProtocol {
    func map(_ categories: [Category]) -> [CashFlowTableViewCellViewObject]
}
