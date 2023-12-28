import Foundation

protocol CategoryCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
    func categoryCreationFinished()
}

protocol CategoryCreationOutputViewProtocol {
    func viewDidLoad()
    func didSelectItemEvent(_ viewObject: CashFlowTableViewCellViewObject)
    func createCategoryWith()
    func updateCategoryName(_ text: String)
}
