import Foundation

class CategoryListinteractor {
    
    weak var presenter: CategoryListinteractorOutputProtocol?
    var categoryRealmDAO: CategoryDAO
    var categoryMapper: CategoryToCategoryPOMapperProtocol
    
    init(categoryRealmDAO: CategoryDAO, categoryMapper: CategoryToCategoryPOMapperProtocol) {
        self.categoryRealmDAO = categoryRealmDAO
        self.categoryMapper = categoryMapper
    }
}

extension CategoryListinteractor: CategoryListinteractorInputProtocol {
    
    func fetchAllCategories() {
        let fetchedCategories = categoryRealmDAO.fetchAllCategories()
        let plainCategories = categoryMapper.map(fetchedCategories)
        presenter?.reloadDataWith(plainCategories)
    }
    
    func removeCategory(_ viewObject: CashFlowTableViewCellViewObject) {
        let category = categoryMapper.map(viewObject)
        categoryRealmDAO.remove(category)
    }
}
