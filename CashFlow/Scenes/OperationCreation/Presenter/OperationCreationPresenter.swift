import Foundation

class OperationCreationPresenter {
    
    weak var view: OperationCreationInputViewProtocol?
    var interactor: OperationCreationInteractorInputProtocol
    
    init(view: OperationCreationInputViewProtocol, interactor: OperationCreationInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    
}
extension OperationCreationPresenter: OperationCreationOutputViewProtocol {
    
}

extension OperationCreationPresenter: OperationCreationInteractorOutputProtocol {
    
}
