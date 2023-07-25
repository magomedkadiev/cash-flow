import Foundation

class OperationCreationPresenter {
    
    weak var view: OperationCreationInputViewProtocol?
    var interactor: OperationCreationInteractorInputProtocol
    let router: ApplicationRouter
    
    var categoryName: String = "Без категории"
    var walletName: String = "Наличные"
    
    init(view: OperationCreationInputViewProtocol, interactor: OperationCreationInteractorInputProtocol, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func fillViewObjectsToShow() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        var headerSectionObjects = [CashFlowTableViewCellViewObject]()
        var totalAmountSectionObjects = [CashFlowTableViewCellViewObject]()
        var categorySectionObjects = [CashFlowTableViewCellViewObject]()
        var saveButtonSectionObjects = [CashFlowTableViewCellViewObject]()

        let headerViewObject = OperationCreationHeaderViewObject()
        let totalAmountViewObject = OperationCreationTotalAmountViewObject()
        let сategoryViewObject = OperationCreationCategoryViewObject(name: categoryName)
        let walletViewObject = OperationCreationWalletCategoryViewObject(name: walletName)
        let saveButtonViewObject = OperationCreationSaveButtonViewObject()

        headerSectionObjects.append(headerViewObject)
        totalAmountSectionObjects.append(totalAmountViewObject)
        categorySectionObjects.append(сategoryViewObject)
        categorySectionObjects.append(walletViewObject)
        saveButtonSectionObjects.append(saveButtonViewObject)
        
        viewObjects.append(headerSectionObjects)
        viewObjects.append(totalAmountSectionObjects)
        viewObjects.append(categorySectionObjects)
        viewObjects.append(saveButtonSectionObjects)

        view?.showInfo(viewObjects)
    }
    
    fileprivate func prepareStoredViewObjects() {
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
    
    func eventItemSelected(_ viewObject: CashFlowTableViewCellViewObject, totalAmount: String) {
        
        switch viewObject.selectedRowType {
        case .categoryButton:
            router.openCategoryList()
        case .walletButton:
            router.openWalletList()
        case .saveButton:
            prepareStoredViewObjects()
        default:
            break
        }
    }
    
    func configureSelected(viewObject: CashFlowTableViewCellViewObject) {
        if let categoryViewObject = viewObject as? OperationCreationCategoryViewObject {
            categoryName = categoryViewObject.name
        } else if let walletViewObject = viewObject as? OperationCreationWalletCategoryViewObject {
            walletName = walletViewObject.name
        }
        
        fillViewObjectsToShow()
    }
}

extension OperationCreationPresenter: OperationCreationInteractorOutputProtocol {
    
}
