import Foundation

class CategoryCreationToCategoryCreationTemplateViewObjectMapper: CategoryCreationToCategoryCreationTemplateViewObjectMapperProtocol {
    
    func map(_ viewObject: CategoryListViewObject) -> CategoryCreationTemplateViewObject {
        return CategoryCreationTemplateViewObject(id: viewObject.id, name: viewObject.subCategories.first?.name ?? "",
                                                  parentCategoryName: viewObject.name,
                                                  parentID: viewObject.subCategories.first?.parentID ?? "")
    }
}

protocol CategoryCreationToCategoryCreationTemplateViewObjectMapperProtocol {
    func map(_ viewObject: CategoryListViewObject) -> CategoryCreationTemplateViewObject
}

