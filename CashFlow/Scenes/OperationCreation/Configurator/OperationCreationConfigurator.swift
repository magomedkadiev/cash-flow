import Foundation

class OperationCreationConfigurator {
    
    func configure(viewController: OperationCreationViewController) {
        let operationsDAO: OperationsDAO = OperationsRealmDAO()
        let interactor = OperationCreationInteractor(operationsRealmDAO: operationsDAO)
        let router = Router()
        let templateViewObject = OperationCreationTemplateViewObject(id: UUID().uuidString,
                                                                            categoryName: "(Без категории)",
                                                                            categoryID: UUID().uuidString,
                                                                            parentID: UUID().uuidString,
                                                                            date: .now,
                                                                            totalAmount: 0,
                                                                            type: .expense,
                                                                            comment: "")
        let templateViewObjectMapper = OperationCreationTemplateViewObjectToOperationViewObjetMapper()
        let presenter = OperationCreationPresenter(view: viewController, interactor: interactor, router: router, templateViewObject: templateViewObject, templateViewObjectMapper: templateViewObjectMapper)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
