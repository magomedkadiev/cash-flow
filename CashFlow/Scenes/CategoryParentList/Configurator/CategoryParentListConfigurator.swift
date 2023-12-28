import Foundation

class CategoryParentListConfigurator {
    
    func configure(_ viewController: CategoryParentListViewController) {
        let categoryRealmDAO: CategoryDAO = CategoryRealmDAO()
        let categoryMapper: CategoryToCategoryParentViewObjectMapperProtocol = CategoryToCategoryParentViewObjectMapper()
        let presenter = CategoryParentListPresenter(view: viewController)
        let interactor = CategoryParentListInteractor(presenter: presenter, categoryRealmDAO: categoryRealmDAO, categoryMapper: categoryMapper)
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
