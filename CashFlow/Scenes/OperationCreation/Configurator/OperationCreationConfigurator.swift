import Foundation

class OperationCreationConfigurator {
    
    func configure(viewController: OperationCreationViewController) {
        let interactor = OperationCreationInteractor()
        let presenter = OperationCreationPresenter(view: viewController, interactor: interactor)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
