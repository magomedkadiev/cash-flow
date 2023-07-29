import Foundation

protocol OperationCreationInteractorInputProtocol {
    func performSaveOperationRequest(with operation: OperationPO)
}

protocol OperationCreationInteractorOutputProtocol: AnyObject {
    func operationCreationFinished()
}
