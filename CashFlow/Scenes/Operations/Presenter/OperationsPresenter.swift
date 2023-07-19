import Foundation

class OperationsPresenter {
    
    weak var view: OperationsInputViewProtocol?
    var interactor: OperationsInteractorInputProtocol
    
    init(view: OperationsInputViewProtocol, interactor: OperationsInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fillViewObjectsToShow() {
        
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        
        var operationsWalletsSectionObjecs = [CashFlowTableViewCellViewObject]()
        
        let operationsWalletsViewObject = OperationsWalletsViewObject()
        
        operationsWalletsSectionObjecs.append(operationsWalletsViewObject)
        operationsWalletsSectionObjecs.append(operationsWalletsViewObject)
        operationsWalletsSectionObjecs.append(operationsWalletsViewObject)
        
        viewObjects.append(operationsWalletsSectionObjecs)
        view?.showInfo(viewObjects)
    }

}

extension OperationsPresenter: OperationsOutputViewProtocol {
    
    func viewDidLoad() {
        fillViewObjectsToShow()
//        interactor.fetchAllOperations()
//        interactor.fetchAllExpenses()
    }
    
    func createNewExpenseButtonTappedWith(expenseName: String) {
        let expense = ExpensePO(id: UUID().uuidString, name: expenseName, totalValue: 0) // default value in start
        interactor.createNew(expense)
    }
}

extension OperationsPresenter: OperationsInteractorOutputProtocol {
    
//    func reloadDataWith(_ operations: [OperationPO]) {
//        view?.refreshTableView(operations: operations)
//    }
//
//    func reloadDataWith(_ expenses: [ExpensePO]) {
//        view?.refreshTableView(expenses: expenses)
//    }
}
