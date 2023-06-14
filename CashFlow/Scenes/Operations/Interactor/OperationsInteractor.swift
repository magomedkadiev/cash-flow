import Foundation

class OperationsInteractor {
    
    weak var presenter: OperationsInteractorOutputProtocol?
    
    init(presenter: OperationsInteractorOutputProtocol? = nil) {
        self.presenter = presenter
    }
}

extension OperationsInteractor: OperationsInteractorInputProtocol {
    
}
