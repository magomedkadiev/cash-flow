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
        let fetchedCatetories = categoryRealmDAO.fetchAllCategories()
        let mappedObjects = categoryMapper.map(fetchedCatetories)
        presenter?.reloadDataWith(mappedObjects)
    }
    
    func moveRow(_ from: Int, _ to: Int) {
        categoryRealmDAO.move(from: from, to: to)
        fetchAllCategories()
    }
}
