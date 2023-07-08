import Foundation

class OperationsConfigurator {
    
    func configureWith(_ viewController: OperationsViewController) {
        let operationsDAO = OperationsRealmDAO()
        let operationsMapper = OperationsToOperationsPOMapper()
        let expensesMapper = ExpensesToExpensesPOMapper()
        let interactor = OperationsInteractor(operationsRealmDAO: operationsDAO, operationsMapper: operationsMapper, expensesMapper: expensesMapper)
        let presenter = OperationsPresenter(view: viewController, interactor: interactor)
        interactor.presenter = presenter
        viewController.presenter = presenter
    }
}
