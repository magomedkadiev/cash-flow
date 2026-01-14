import Foundation

class OperationCreationTemplateViewObjectToOperationViewObjetMapper {
    func map(_ operationViewObject: OperationViewObject) -> OperationCreationTemplateViewObject {
        return OperationCreationTemplateViewObject(id: operationViewObject.id,
                                                   categoryName: operationViewObject.categoryName,
                                                   categoryID: operationViewObject.categoryID,
                                                   parentID: "operationViewObject.parentID",
                                                   date: operationViewObject.date,
                                                   totalAmount: operationViewObject.totalAmount,
                                                   type: operationViewObject.type,
                                                   comment: operationViewObject.comment)
    }
}
