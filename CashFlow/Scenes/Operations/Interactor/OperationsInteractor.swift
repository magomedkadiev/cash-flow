import Foundation

class OperationsInteractor {
    
    weak var presenter: OperationsInteractorOutputProtocol?
    var operationsRealmDAO: OperationsDAO
    var operationsMapper: OperationsToOperationsPOMapperProtocol
    
    init(presenter: OperationsInteractorOutputProtocol? = nil, operationsRealmDAO: OperationsDAO, operationsMapper: OperationsToOperationsPOMapperProtocol) {
        self.operationsRealmDAO = operationsRealmDAO
        self.presenter = presenter
        self.operationsMapper = operationsMapper
    }
}

extension OperationsInteractor: OperationsInteractorInputProtocol {

    func fetchAllOperations() {
        let fetchedOperations = operationsRealmDAO.fetchAllOperations()
        let mappedOperations = self.operationsMapper.map(fetchedOperations)
        self.presenter?.reloadDataWith(mappedOperations)
    }
}
