import Foundation

protocol CategoryParentListInputViewProtocol: AnyObject {
    func showInfo(_ plainObjects: [CashFlowTableViewCellViewObject])
}

protocol CategoryParentListOutputViewProtocol {
    func viewDidLoad()
    func moveRow(from: Int, to: Int)
    func didDeleteButtonTapped(_ viewObject: CashFlowTableViewCellViewObject)

}
