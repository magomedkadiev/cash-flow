import Foundation

class OperationCreationConfigurator {
    
    func configure(viewController: OperationCreationViewController) {
        let operationsDAO: OperationsDAO = OperationsRealmDAO()
        let interactor = OperationCreationInteractor(operationsRealmDAO: operationsDAO)
        let router = Router()
        let templateViewObject = OperationCreationTemplateViewObject(id: UUID().uuidString,
                                                                            categoryName: "(Без категории)",
                                                                            date: .now,
                                                                            totalAmount: 0,
                                                                            type: .expense)
        let templateViewObjectMapper = OperationCreationTemplateViewObjectToOperationViewObjetMapper()
        let presenter = OperationCreationPresenter(view: viewController, interactor: interactor, router: router, templateViewObject: templateViewObject, templateViewObjectMapper: templateViewObjectMapper)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
