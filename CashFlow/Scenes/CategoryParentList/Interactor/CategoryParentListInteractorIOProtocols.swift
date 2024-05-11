import Foundation

protocol CategoryParentListInteractorInputProtocol {
    func fetchAllCategories()
    func moveRow(_ from: Int, _ to: Int)
    func removeCategory(_ viewObject: CashFlowTableViewCellViewObject)

}

protocol CategoryParentListInteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ viewObjects: [CategoryPO])
}
