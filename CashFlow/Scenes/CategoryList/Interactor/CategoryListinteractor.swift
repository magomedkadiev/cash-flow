import Foundation

class CategoryListinteractor {
    
    weak var presenter: CategoryListinteractorOutputProtocol?
    var categoryRealmDAO: CategoryDAO
    var categoryMapper: CategoryToCategoryListViewObjectMapperProtocol
    
    init(categoryRealmDAO: CategoryDAO, categoryMapper: CategoryToCategoryListViewObjectMapperProtocol) {
        self.categoryRealmDAO = categoryRealmDAO
        self.categoryMapper = categoryMapper
    }
}

extension CategoryListinteractor: CategoryListinteractorInputProtocol {
    
    func fetchAllCategories() {
        let fetchedCategories = categoryRealmDAO.fetchAllCategories()
        let mappedCategories = categoryMapper.map(fetchedCategories)
        presenter?.reloadDataWith(mappedCategories)
    }
}
