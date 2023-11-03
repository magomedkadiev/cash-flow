import Foundation

class OperationsPresenter {
    
    weak var view: OperationsInputViewProtocol?
    var interactor: OperationsInteractorInputProtocol
    let mapper: OperationsPOToOperationViewObjectsMapperProtocol
    let router: ApplicationRouter
    
    init(view: OperationsInputViewProtocol, interactor: OperationsInteractorInputProtocol, mapper: OperationsPOToOperationViewObjectsMapperProtocol, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
    
    private func fillViewObjectsToShow(operations: [CashFlowTableViewCellViewObject]? = nil) {
        var viewObjectsByDateDictionary = [Date: [OperationViewObject]]()
        guard let operations = operations as? [OperationViewObject] else { return }
        
//        let operation = OperationViewObject(categoryName: "2", walletName: "1", totalAmount: "2", date: "2023-10-29".toDate())
//        let operation2 = OperationViewObject(categoryName: "2", walletName: "1", totalAmount: "2", date: "2023-10-29".toDate())
//        let operation3 = OperationViewObject(categoryName: "2", walletName: "1", totalAmount: "2", date: "2023-10-29".toDate())
//        let operation4 = OperationViewObject(categoryName: "2", walletName: "1", totalAmount: "2", date: "2023-10-25".toDate())
//        let operation5 = OperationViewObject(categoryName: "2", walletName: "1", totalAmount: "2", date: "2023-10-25".toDate())
//
//        operations.append(contentsOf: [operation, operation2, operation3, operation4, operation5])
        
        for operation in operations {
            let operationDate = operation.date
            var headerDate: Date?
            
            // Сравниваю даты ключей с текущей
            let keys = viewObjectsByDateDictionary.keys.map { date in
                if date.hasSame(.day, as: operationDate) {
                    headerDate = date
                    return true
                }
                headerDate = operationDate
                return false
            }

            // Если нет такой даты, то создаю новый хедер
            if !keys.contains(true) {
                viewObjectsByDateDictionary[operationDate] = []
            }
            
            var operationsArray = viewObjectsByDateDictionary[headerDate ?? Date()]
            operationsArray?.append(operation)
            operationsArray?.sort(by: {$0.date > $1.date })
            viewObjectsByDateDictionary[headerDate ?? Date()] = operationsArray
        }
        
        let sortedViewObjects = viewObjectsByDateDictionary.sorted(by: {$0.key > $1.key})
        view?.showInfo(sortedViewObjects)
    }
}

extension OperationsPresenter: OperationsOutputViewProtocol {
    
    func viewDidLoad() {
        fillViewObjectsToShow()
        interactor.fetchAllOperations()
    }
    
    func fetchAllOperations() {
        interactor.fetchAllOperations()
    }
}

extension OperationsPresenter: OperationsInteractorOutputProtocol {
    
    func reloadDataWith(_ operations: [OperationPO]) {
        let mappedOperations = mapper.map(operations)
        fillViewObjectsToShow(operations: mappedOperations)
    }
    
    func eventBeginFerfeshing() {
        router.openOperationCreationScreen()
    }
}
