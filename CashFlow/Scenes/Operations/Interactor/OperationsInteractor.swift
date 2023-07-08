import Foundation

class OperationsInteractor {
    
    weak var presenter: OperationsInteractorOutputProtocol?
    var operationsRealmDAO: OperationsDAO?
    var operationsMapper: OperationsToOperationsPOMapperProtocol
    var expensesMapper: ExpensesToExpensesPOMapperProtocol
    
    init(presenter: OperationsInteractorOutputProtocol? = nil, operationsRealmDAO: OperationsDAO, operationsMapper: OperationsToOperationsPOMapperProtocol, expensesMapper: ExpensesToExpensesPOMapperProtocol) {
        self.operationsRealmDAO = operationsRealmDAO
        self.presenter = presenter
        self.operationsMapper = operationsMapper
        self.expensesMapper = expensesMapper
    }
    
    
}

extension OperationsInteractor: OperationsInteractorInputProtocol {
    
    func createNew(_ operation: OperationPO) {
        operationsRealmDAO?.creationOperation(operation, complitionHandler: {
            self.fetchAllOperations()
        })
    }
    
    func fetchAllOperations() {
        guard let fetchedOperations = operationsRealmDAO?.fetchAllOperations() else {
            return
        }
        let mappedOperations = self.operationsMapper.map(fetchedOperations)
        self.presenter?.reloadDataWith(mappedOperations)
    }
    
    // Crete New Expense in Realm
    func createNew(_ expense: ExpensePO) {
        operationsRealmDAO?.createNew(expense, complitionHandler: {
            self.fetchAllExpenses()
        })
    }
    
    func fetchAllExpenses() {
        guard let fetchedExpenses = operationsRealmDAO?.fetchAllExpenses() else {
            return
        }
        let mappedObjects = self.expensesMapper.map(fetchedExpenses)
        self.presenter?.reloadDataWith(mappedObjects)
        
    }
}
