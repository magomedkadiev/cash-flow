import Foundation

protocol CategoryCreationInteractorInputProtocol {
    func performsaveCategoryRequest(_ categoryPO: CategoryPO)
}

protocol CategoryCreationInteractorOutputProtocol: AnyObject {
    func operationCreationFinished()
}
