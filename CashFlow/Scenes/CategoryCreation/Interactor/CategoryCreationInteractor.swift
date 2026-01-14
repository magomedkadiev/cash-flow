import Foundation

class CategoryCreationInteractor {
    
    weak var presenter: CategoryCreationInteractorOutputProtocol?
    var categoryRealmDAO: CategoryDAO
    
    init(categoryRealmDAO: CategoryDAO) {
        self.categoryRealmDAO = categoryRealmDAO
    }
}

extension CategoryCreationInteractor: CategoryCreationInteractorInputProtocol {
    
    func performsaveCategoryRequest(_ categoryPO: CategoryPO) {
        categoryRealmDAO.createNew(category: categoryPO) {
            self.presenter?.operationCreationFinished()
        }
    }
    
    func replaceParentCategory(oldID: String, newCategory: CategoryPO) {
        categoryRealmDAO.replaceParentCategory(oldID: oldID, newCategory: newCategory) {
            self.presenter?.operationCreationFinished()
        }
    }
    
}
