import Foundation

protocol CategoryParentListInputViewProtocol: AnyObject {
    func showInfo(_ plainObjects: [CashFlowTableViewCellViewObject])
}

protocol CategoryParentListOutputViewProtocol {
    func viewDidLoad()
}
