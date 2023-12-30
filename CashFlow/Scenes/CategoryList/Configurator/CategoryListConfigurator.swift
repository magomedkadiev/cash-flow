import Foundation

class CategoryListConfigurator {
    
    func configure(with viewController: CategoryListViewController) {
        let categoryRealmDAO: CategoryDAO = CategoryRealmDAO()
        let categoryMapper: CategoryToCategoryPOMapperProtocol = CategoryToCategoryPOMapper()
        let categoryPOToCategoryViewObjectMapper = CategoryPOToCategoryViewObjectMapper()
        let interactor = CategoryListinteractor(categoryRealmDAO: categoryRealmDAO, categoryMapper: categoryMapper)
        let router: ApplicationRouter = Router()
        let presenter = CategoryListPresenter(view: viewController, interactor: interactor, router: router, mapper: categoryPOToCategoryViewObjectMapper)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
