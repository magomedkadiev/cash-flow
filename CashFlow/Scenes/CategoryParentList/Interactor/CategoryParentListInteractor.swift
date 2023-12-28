import Foundation

class CategoryParentListInteractor {
    
    weak var presenter: CategoryParentListInteractorOutputProtocol?
    let categoryRealmDAO: CategoryDAO
    let categoryMapper: CategoryToCategoryParentViewObjectMapperProtocol
    
    init(presenter: CategoryParentListInteractorOutputProtocol, categoryRealmDAO: CategoryDAO, categoryMapper: CategoryToCategoryParentViewObjectMapperProtocol) {
        self.presenter = presenter
        self.categoryRealmDAO = categoryRealmDAO
        self.categoryMapper = categoryMapper
    }
}

extension CategoryParentListInteractor: CategoryParentListInteractorInputProtocol {
    
    func fetchAllCategories() {
        let fetchedCatetories = categoryRealmDAO.fetchAllCategories()
        let mappedObjects = categoryMapper.map(fetchedCatetories)
        presenter?.reloadDataWith(mappedObjects)
    }
}
