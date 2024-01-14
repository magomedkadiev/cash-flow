import Foundation

protocol CategoryListinteractorInputProtocol {
    func fetchAllCategories()
    func removeCategory(_ viewObject: CashFlowTableViewCellViewObject)
}

protocol CategoryListinteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ plainObjects: [CategoryPO])
}
