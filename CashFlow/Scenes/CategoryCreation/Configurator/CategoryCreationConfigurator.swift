import Foundation

class CategoryCreationConfigurator {
    
    func configure(_ viewController: CategoryCreationViewController) {
        let presenter = CategoryCreationPresenter(view: viewController)
        let interactor = CategoryCreationInteractor()
        viewController.presenter = presenter
        interactor.presenter = presenter
    }
}
