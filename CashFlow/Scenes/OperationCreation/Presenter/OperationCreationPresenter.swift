import Foundation

class OperationCreationPresenter {
    
    weak var view: OperationCreationInputViewProtocol?
    var interactor: OperationCreationInteractorInputProtocol
    
    init(view: OperationCreationInputViewProtocol, interactor: OperationCreationInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fillViewObjectsToShow() {
        let headerViewObject = OperationCreationHeaderViewObject(sectionItem: 0)
        let сategoryViewObject = OperationCreationCategoryViewObject(sectionItem: 1)
        let walletViewObject = OperationCreationWalletCategoryViewObject(sectionItem: 1)
        let saveButtonViewObject = OperationCreationSaveButtonViewObject(sectionItem: 2)
        
        
        var viewObjects = [CashFlowTableViewCellViewObject]()
        viewObjects.append(headerViewObject)
        viewObjects.append(сategoryViewObject)
        viewObjects.append(walletViewObject)
        viewObjects.append(saveButtonViewObject)
        view?.showInfo(viewObjects)
    }
    
}
extension OperationCreationPresenter: OperationCreationOutputViewProtocol {
    
    func viewDidLoad() {
        fillViewObjectsToShow()
    }
}

extension OperationCreationPresenter: OperationCreationInteractorOutputProtocol {
    
}
