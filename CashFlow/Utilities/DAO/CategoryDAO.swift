import Foundation

protocol CategoryDAO {
    func fetchAllCategories() -> [Category]
    func fetchAllParentCategories() -> [Category]
    func createNew(category: CategoryPO, complitionHandler: @escaping () -> Void?)
}
