import Foundation

protocol CategoryCreationInputViewProtocol: AnyObject {
    func showInfo(_ viewObjects: [[CashFlowTableViewCellViewObject]])
    func categoryCreationFinished()
}

protocol CategoryCreationOutputViewProtocol {
    func viewDidLoad(_ viewObject: CashFlowTableViewCellViewObject?)
    func didSelectItemEvent(_ viewObject: CashFlowTableViewCellViewObject)
    func createCategoryEvent()
    func updateCategoryName(_ text: String)
    func updateParentCategoryName(_ viewObject: CashFlowTableViewCellViewObject)
}
