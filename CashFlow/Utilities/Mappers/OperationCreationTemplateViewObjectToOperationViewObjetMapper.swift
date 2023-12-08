import Foundation

class OperationCreationTemplateViewObjectToOperationViewObjetMapper {
    func map(_ operationViewObject: OperationViewObject) -> OperationCreationTemplateViewObject {
        return OperationCreationTemplateViewObject(id: operationViewObject.id,
                                                   categoryName: operationViewObject.categoryName,
                                                   date: operationViewObject.date,
                                                   totalAmount: operationViewObject.totalAmount,
                                                   type: operationViewObject.type)
    }
}
