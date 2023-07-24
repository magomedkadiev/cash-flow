import Foundation

class CategoryListConfigurator {
    
    func configure(with viewController: CategoryListViewController) {
        let interactor = CategoryListinteractor()
        let presenter = CategoryListPresenter(view: viewController, interactor: interactor)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
