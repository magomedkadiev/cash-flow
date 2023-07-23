import Foundation

class OperationCreationPresenter {
    
    weak var view: OperationCreationInputViewProtocol?
    var interactor: OperationCreationInteractorInputProtocol
    let router: ApplicationRouter
    
    init(view: OperationCreationInputViewProtocol, interactor: OperationCreationInteractorInputProtocol, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func fillViewObjectsToShow() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        var headerSectionObjects = [CashFlowTableViewCellViewObject]()
        var categorySectionObjects = [CashFlowTableViewCellViewObject]()
        var saveButtonSectionObjects = [CashFlowTableViewCellViewObject]()

        let headerViewObject = OperationCreationHeaderViewObject()
        let сategoryViewObject = OperationCreationCategoryViewObject()
        let walletViewObject = OperationCreationWalletCategoryViewObject()
        let saveButtonViewObject = OperationCreationSaveButtonViewObject()

        headerSectionObjects.append(headerViewObject)
        categorySectionObjects.append(сategoryViewObject)
        categorySectionObjects.append(walletViewObject)
        saveButtonSectionObjects.append(saveButtonViewObject)
        
        viewObjects.append(headerSectionObjects)
        viewObjects.append(categorySectionObjects)
        viewObjects.append(saveButtonSectionObjects)

        view?.showInfo(viewObjects)
    }
    
}
extension OperationCreationPresenter: OperationCreationOutputViewProtocol {
    
    func viewDidLoad() {
        fillViewObjectsToShow()
    }
    
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject) {
        switch viewObject.selectedRowType {
        case .categoryButton:
            router.openCategoryList()
        default:
            break
        }
    }
}

extension OperationCreationPresenter: OperationCreationInteractorOutputProtocol {
    
}
