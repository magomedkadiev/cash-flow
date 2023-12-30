import Foundation

protocol CategoryListInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject])
}

protocol CategoryListOutputViewProtocol {
    func viewDidLoad()
    func fetchAllCategories()
    func dismissViewController()
    func isReadyForEditing() -> Bool
    func addButtonTapped()
    func openCategoryCreationScreen(with viewObject: CashFlowTableViewCellViewObject)
}
