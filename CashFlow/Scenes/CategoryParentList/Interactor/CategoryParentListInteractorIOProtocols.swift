import Foundation

protocol CategoryParentListInteractorInputProtocol {
    func fetchAllCategories()
}

protocol CategoryParentListInteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ viewObjects: [CategoryPO])
}
