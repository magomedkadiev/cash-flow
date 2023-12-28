import Foundation

protocol CategoryDAO {
    func fetchAllCategories() -> [Category]
    func createNew(category: CategoryPO, complitionHandler: @escaping () -> Void?)
}
