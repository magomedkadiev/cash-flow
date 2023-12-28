import Foundation

protocol CategoryListinteractorInputProtocol {
    func fetchAllCategories()
}

protocol CategoryListinteractorOutputProtocol: AnyObject {
    func reloadDataWith(_ mappedObjects: [CashFlowTableViewCellViewObject])
}
