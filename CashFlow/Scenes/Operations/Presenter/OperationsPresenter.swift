import Foundation

class OperationsPresenter {
    
    weak var view: OperationsInputViewProtocol?
    var interactor: OperationsInteractorInputProtocol
    
    init(view: OperationsInputViewProtocol, interactor: OperationsInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension OperationsPresenter: OperationsOutputViewProtocol {
    
    func viewDidLoad() {
        interactor.fetchAllOperations()
    }
    
    func addNewOperationButtonTapped(_ tag: Int) {
        switch tag {
        case 1: // income
            break
        case 2: // loss
            let operation = OperationPO(id: "", type: "", category: "", wallet: "", data: Data(), comment: "", sum: "")
            interactor.createNewOperation(operation)
        case 3: // transfer
            break
        default:
            break
        }
    }
}

extension OperationsPresenter: OperationsInteractorOutputProtocol {
    func reloadDataWith(_ operations: [OperationPO]) {
        view?.refreshTableView(operations: operations)
    }
}
