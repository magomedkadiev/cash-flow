import Foundation

class CategoryListConfigurator {
    
    func configure(with viewController: CategoryListViewController) {
        let interactor = CategoryListinteractor()
        let router: ApplicationRouter = Router()
        let presenter = CategoryListPresenter(view: viewController, interactor: interactor, router: router)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
