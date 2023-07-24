import Foundation

protocol CategoryListInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject])
}

protocol CategoryListOutputViewProtocol {
    func viewDidLoad()
}
