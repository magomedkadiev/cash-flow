import Foundation

class CategoryCreationConfigurator {
    
    func configure(_ viewController: CategoryCreationViewController) {
        let router: ApplicationRouter = Router()
        let categoryRealmDAO: CategoryDAO = CategoryRealmDAO()
        let interactor = CategoryCreationInteractor(categoryRealmDAO: categoryRealmDAO)
        let presenter = CategoryCreationPresenter(view: viewController, router: router, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
    }
}
