import Foundation

class OperationCreationConfigurator {
    
    func configure(viewController: OperationCreationViewController) {
        let operationsDAO: OperationsDAO = OperationsRealmDAO()
        let interactor = OperationCreationInteractor(operationsRealmDAO: operationsDAO)
        let router = Router()
        let presenter = OperationCreationPresenter(view: viewController, interactor: interactor, router: router)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
