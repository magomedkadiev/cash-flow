import Foundation

protocol WalletListInputViewProtocol: AnyObject{
    func showInfo(_ viewObjects: [CashFlowTableViewCellViewObject])
}

protocol WalletListOutputViewProtocol {
    func viewDidLoad()
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject)
}
