import Foundation

protocol CategoryDAO {
    func fetchAllCategories() -> [Category]
    func createNew(category: CategoryPO, complitionHandler: @escaping () -> Void?)
    func remove(_ category: Category)
    func move(from: Int, to: Int)
}
