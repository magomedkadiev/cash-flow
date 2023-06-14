import Foundation

class OperationsInteractor {
    
    weak var presenter: OperationsInteractorOutputProtocol?
    var operationsRealmDAO: OperationsDAO?
    var mapper: OperationsToOperationsPOMapperProtocol
    
    init(presenter: OperationsInteractorOutputProtocol? = nil, operationsRealmDAO: OperationsDAO, mapper: OperationsToOperationsPOMapperProtocol) {
        self.operationsRealmDAO = operationsRealmDAO
        self.presenter = presenter
        self.mapper = mapper
    }
    
    
}

extension OperationsInteractor: OperationsInteractorInputProtocol {
    
    func createNewOperation(_ operation: OperationPO) {
        operationsRealmDAO?.creationOperation(operation, complitionHandler: {
            self.fetchAllOperations()
        })
    }
    
    func fetchAllOperations() {
        guard let fetchedOperations = operationsRealmDAO?.fetchAllOperations() else {
            return
        }
        let mappedOperations = self.mapper.map(fetchedOperations)
        self.presenter?.reloadDataWith(mappedOperations)
    }
}
