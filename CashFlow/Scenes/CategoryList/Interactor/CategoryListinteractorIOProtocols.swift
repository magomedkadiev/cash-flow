import Foundation

protocol CategoryListinteractorInputProtocol {
    func fetchAllCategories()
    func loadCategoryTemplates()
}

protocol CategoryListinteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ plainObjects: [CategoryPO])
}
