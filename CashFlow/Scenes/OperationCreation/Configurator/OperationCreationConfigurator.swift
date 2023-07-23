import Foundation

class OperationCreationConfigurator {
    
    func configure(viewController: OperationCreationViewController) {
        let interactor = OperationCreationInteractor()
        let router = Router()
        let presenter = OperationCreationPresenter(view: viewController, interactor: interactor, router: router)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
