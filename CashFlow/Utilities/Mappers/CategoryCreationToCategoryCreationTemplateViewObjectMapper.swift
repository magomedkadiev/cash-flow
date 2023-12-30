import Foundation

class CategoryCreationToCategoryCreationTemplateViewObjectMapper: CategoryCreationToCategoryCreationTemplateViewObjectMapperProtocol {
    
    func map(_ viewObject: CategoryListViewObject) -> CategoryCreationTemplateViewObject {
        return CategoryCreationTemplateViewObject(name: viewObject.subCategories.first?.name ?? "",
                                                  parentCategoryName: viewObject.name,
                                                  parentID: viewObject.id)
    }
}

protocol CategoryCreationToCategoryCreationTemplateViewObjectMapperProtocol {
    func map(_ viewObject: CategoryListViewObject) -> CategoryCreationTemplateViewObject
}

