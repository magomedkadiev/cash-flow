import Foundation

protocol CategoryListInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject])
}

protocol CategoryListOutputViewProtocol {
    func viewDidLoad()
    func fetchAllCategories()
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject)
    func isReadyForEditing() -> Bool
    func addButtonTapped()
}
