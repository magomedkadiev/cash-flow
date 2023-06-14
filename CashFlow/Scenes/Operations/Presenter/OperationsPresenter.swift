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
    
}

extension OperationsPresenter: OperationsInteractorOutputProtocol {
    
}
