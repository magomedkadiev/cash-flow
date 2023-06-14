import Foundation

class OperationsConfigurator {
    
    func configureWith(_ viewController: OperationsViewController) {
        let operationsDAO = OperationsRealmDAO()
        let mapper = OperationsToOperationsPOMapper()
        let interactor = OperationsInteractor(operationsRealmDAO: operationsDAO, mapper: mapper)
        let presenter = OperationsPresenter(view: viewController, interactor: interactor)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
