import Foundation

protocol CategoryCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
}

protocol CategoryCreationOutputViewProtocol {
    func viewDidLoad()
}
