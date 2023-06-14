import Foundation

class OperationsConfigurator {
    
    func configureWith(_ viewController: OperationsViewController) {
        let interactor = OperationsInteractor()
        let presenter = OperationsPresenter(view: viewController, interactor: interactor)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
