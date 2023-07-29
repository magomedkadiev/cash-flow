import Foundation

class OperationCreationInteractor {
    
    weak var presenter: OperationCreationInteractorOutputProtocol?
    var operationsRealmDAO: OperationsDAO?
    
    init(operationsRealmDAO: OperationsDAO) {
        self.operationsRealmDAO = operationsRealmDAO
    }
}

extension OperationCreationInteractor: OperationCreationInteractorInputProtocol {
    
    func performSaveOperationRequest(with operation: OperationPO) {
        operationsRealmDAO?.creationOperation(operation, complitionHandler: {
            self.presenter?.operationCreationFinished()
        })
    }
}
