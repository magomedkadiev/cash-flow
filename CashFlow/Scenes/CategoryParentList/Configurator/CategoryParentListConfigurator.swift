import Foundation

class CategoryParentListConfigurator {
    
    func configure(_ viewController: CategoryParentListViewController) {
        let categoryRealmDAO: CategoryDAO = CategoryRealmDAO()
        let categoryMapper: CategoryToCategoryPOMapperProtocol = CategoryToCategoryPOMapper()
        let categoryToCategoryViewObjectsMapper: CategoryToCategoryParentViewObjectMapperProtocol = CategoryToCategoryParentViewObjectMapper()
        let presenter = CategoryParentListPresenter(view: viewController, mapper: categoryToCategoryViewObjectsMapper)
        let interactor = CategoryParentListInteractor(presenter: presenter, categoryRealmDAO: categoryRealmDAO, categoryMapper: categoryMapper)
        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
