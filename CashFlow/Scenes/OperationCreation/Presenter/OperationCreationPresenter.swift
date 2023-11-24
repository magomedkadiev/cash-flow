import Foundation

class OperationCreationPresenter {
    
    weak var view: OperationCreationInputViewProtocol?
    var interactor: OperationCreationInteractorInputProtocol
    let router: ApplicationRouter
    
    var selectedCategoryViewObject: OperationCreationCategoryViewObject?
    var totalAmount: String = ""
    
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
        let сategoryViewObject = OperationCreationCategoryViewObject(name: selectedCategoryViewObject?.name ?? "Без категории")
        let saveButtonViewObject = OperationCreationSaveButtonViewObject()

        headerSectionObjects.append(headerViewObject)
        totalAmountSectionObjects.append(totalAmountViewObject)
        categorySectionObjects.append(сategoryViewObject)
        saveButtonSectionObjects.append(saveButtonViewObject)
        
        viewObjects.append(headerSectionObjects)
        viewObjects.append(totalAmountSectionObjects)
        viewObjects.append(categorySectionObjects)
        viewObjects.append(saveButtonSectionObjects)

        view?.showInfo(viewObjects)
    }
    
    fileprivate func prepareSelectedViewObjects() {
        
        guard let selectedCategoryViewObject = selectedCategoryViewObject else {
            return
        }
        
        
        let categoryPO = CategoryPO(id: "selectedCategoryViewObject.id", name: selectedCategoryViewObject.name)
        
        let operationPO = OperationPO(id: UUID().uuidString,
                                      type: .expense,
                                      category: categoryPO,
                                      sum: totalAmount,
                                      date: Date(),
                                      comment: "")
        interactor.performSaveOperationRequest(with: operationPO)
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
        case .saveButton:
            self.totalAmount = totalAmount
            prepareSelectedViewObjects()
        default:
            break
        }
    }
    
    func configureSelected(viewObject: CashFlowTableViewCellViewObject) {
        if let categoryViewObject = viewObject as? OperationCreationCategoryViewObject {
            selectedCategoryViewObject = categoryViewObject
        }
        fillViewObjectsToShow()
    }
}

extension OperationCreationPresenter: OperationCreationInteractorOutputProtocol {
    
    func operationCreationFinished() {
        DispatchQueue.main.async {
            self.router.dismiss()
            self.view?.operationCreationFinished()
        }
    }
}

