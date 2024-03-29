import Foundation

class OperationsConfigurator {
    
    func configureWith(_ viewController: OperationsViewController) {
        let operationsDAO = OperationsRealmDAO()
        let operationsMapper = OperationsToOperationsPOMapper()
        let router: ApplicationRouter = Router()
        let operationsPOToOperationViewObjectsMapper = OperationsPOToOperationViewObjectsMapper()
        let interactor = OperationsInteractor(operationsRealmDAO: operationsDAO, operationsMapper: operationsMapper)
        let presenter = OperationsPresenter(view: viewController, interactor: interactor, mapper: operationsPOToOperationViewObjectsMapper, router: router)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
