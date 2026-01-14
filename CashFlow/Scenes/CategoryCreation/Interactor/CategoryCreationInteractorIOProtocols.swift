import Foundation

protocol CategoryCreationInteractorInputProtocol {
    func performsaveCategoryRequest(_ categoryPO: CategoryPO)
    func replaceParentCategory(oldID: String, newCategory: CategoryPO)
}

protocol CategoryCreationInteractorOutputProtocol: AnyObject {
    func operationCreationFinished()
}
