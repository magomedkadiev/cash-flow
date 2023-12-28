import Foundation

protocol CategoryParentListInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject])
}

protocol CategoryParentListOutputViewProtocol {
    func viewDidLoad()
}
