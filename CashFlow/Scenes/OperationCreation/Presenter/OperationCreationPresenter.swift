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
    
    fileprivate func prepareStoredViewObjects(_ storedViewObjects: [CashFlowTableViewCellViewObject]) {
        
//        guard let categoryViewObject = storedViewObjects.compactMap({ $0.self as? OperationCreationCategoryViewObject }).first else {
//            return
//        }
//        
//        guard let walletViewObject = storedViewObjects.compactMap({ $0.self as? WalletListViewObject }).first else {
//            return
//        }
        
//        let _ = OperationPO(id: UUID().uuidString, type: .expense, category: categoryViewObject, wallet: walletViewObject, data: Data(), comment: "")

    }
    
}
extension OperationCreationPresenter: OperationCreationOutputViewProtocol {
    
    func viewDidLoad() {
        fillViewObjectsToShow()
    }
    
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject, storedViewObjects: [CashFlowTableViewCellViewObject]) {
        
        switch viewObject.selectedRowType {
        case .categoryButton:
            router.openCategoryList()
        case .walletButton:
            router.openWalletList()
        case .saveButton:
            break
            //prepareStoredViewObjects(storedViewObjects)
        default:
            break
        }
    }
}

extension OperationCreationPresenter: OperationCreationInteractorOutputProtocol {
    
}
