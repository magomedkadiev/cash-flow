import Foundation

class CategoryParentListInteractor {
    
    weak var presenter: CategoryParentListInteractorOutputProtocol?
    let categoryRealmDAO: CategoryDAO
    let categoryMapper: CategoryToCategoryPOMapperProtocol
    
    init(presenter: CategoryParentListInteractorOutputProtocol, categoryRealmDAO: CategoryDAO, categoryMapper: CategoryToCategoryPOMapperProtocol) {
        self.presenter = presenter
        self.categoryRealmDAO = categoryRealmDAO
        self.categoryMapper = categoryMapper
    }
}

extension CategoryParentListInteractor: CategoryParentListInteractorInputProtocol {
    
    func fetchAllCategories() {
        let fetchedCatetories = categoryRealmDAO.fetchAllParentCategories()
        let mappedObjects = categoryMapper.map(fetchedCatetories)
        presenter?.reloadDataWith(mappedObjects)
    }
}
