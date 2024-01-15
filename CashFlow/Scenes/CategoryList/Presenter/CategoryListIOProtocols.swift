import Foundation

protocol CategoryListInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject])
    func didSelectHandler(_ viewObject: CategoryListViewObject)
    func hideBarButtonItemIfNedeed(_ value: Bool)
}

protocol CategoryListOutputViewProtocol {
    func viewDidLoad()
    func fetchAllCategories()
    func dismissViewController()
    func addButtonTapped()
    func openCategoryCreationScreen(with viewObject: CashFlowTableViewCellViewObject)
    func removeItemEvent(_ viewObject: CashFlowTableViewCellViewObject)
    func didSelectItemEvent(_ viewObjects: [CategoryListViewObject], indexPath: IndexPath)
}
