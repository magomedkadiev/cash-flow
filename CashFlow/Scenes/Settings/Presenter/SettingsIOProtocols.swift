import Foundation

protocol SettingsInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
}

protocol SettingsOutputViewProtocol {
    func viewDidLoad()
    func didSelectRow(_ viewObject: CashFlowTableViewCellViewObject)
}
