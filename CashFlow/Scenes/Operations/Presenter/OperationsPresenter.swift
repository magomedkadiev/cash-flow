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
        
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        var operationsWalletsSectionObjecs = [CashFlowTableViewCellViewObject]()
        var operationsSectionObjecs = [CashFlowTableViewCellViewObject]()

        // Wallet List
        let operationsWalletsViewObject = OperationsWalletsViewObject()
        operationsWalletsSectionObjecs.append(operationsWalletsViewObject)
        operationsWalletsSectionObjecs.append(operationsWalletsViewObject)
        operationsWalletsSectionObjecs.append(operationsWalletsViewObject)
        
        // Operation List
        if let operations = operations {
            operationsSectionObjecs.append(contentsOf: operations)
        }
        
        viewObjects.append(operationsWalletsSectionObjecs)
        viewObjects.append(operationsSectionObjecs)
        view?.showInfo(viewObjects)
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
