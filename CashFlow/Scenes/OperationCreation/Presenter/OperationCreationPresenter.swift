import Foundation

class OperationCreationPresenter {
    
    weak var view: OperationCreationInputViewProtocol?
    var interactor: OperationCreationInteractorInputProtocol
    let router: ApplicationRouter
    
    private var operationViewObject: CashFlowTableViewCellViewObject?
    var templateViewObject: OperationCreationTemplateViewObject
    var templateViewObjectMapper: OperationCreationTemplateViewObjectToOperationViewObjetMapper
    
    init(view: OperationCreationInputViewProtocol, interactor: OperationCreationInteractorInputProtocol, router: ApplicationRouter, templateViewObject: OperationCreationTemplateViewObject, templateViewObjectMapper: OperationCreationTemplateViewObjectToOperationViewObjetMapper) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.templateViewObject = templateViewObject
        self.templateViewObjectMapper = templateViewObjectMapper
    }
    
    private func fillViewObjectsToShow() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        var headerSectionObjects = [CashFlowTableViewCellViewObject]()
        var totalAmountSectionObjects = [CashFlowTableViewCellViewObject]()
        var categorySectionObjects = [CashFlowTableViewCellViewObject]()
        var saveButtonSectionObjects = [CashFlowTableViewCellViewObject]()
        
        let headerViewObject = OperationCreationHeaderViewObject(type: templateViewObject.type)
        let totalAmountViewObject = OperationCreationTotalAmountViewObject(totalAmount: templateViewObject.totalAmount)
        let сategoryViewObject = CategoryListViewObject(name: templateViewObject.categoryName)
        let dateViewObject = OperationCreationDateViewObject(date: templateViewObject.date)
        let commentViewObject = OperationCreationCommentViewObject(comment: templateViewObject.comment)
        let saveButtonViewObject = OperationCreationSaveButtonViewObject()
        
        headerSectionObjects.append(headerViewObject)
        totalAmountSectionObjects.append(totalAmountViewObject)
        categorySectionObjects.append(сategoryViewObject)
        categorySectionObjects.append(dateViewObject)
        categorySectionObjects.append(commentViewObject)
        saveButtonSectionObjects.append(saveButtonViewObject)
        
        viewObjects.append(headerSectionObjects)
        viewObjects.append(totalAmountSectionObjects)
        viewObjects.append(categorySectionObjects)
        viewObjects.append(saveButtonSectionObjects)
        
        view?.showInfo(viewObjects)
    }
    
    fileprivate func creationNewOperationWith() {
        
        let categoryPO = CategoryPO(id: "selectedCategoryViewObject.id",
                                    name: templateViewObject.categoryName,
                                    parentID: "")
        
        let operationPO = OperationPO(id: templateViewObject.id,
                                      type: templateViewObject.type,
                                      category: categoryPO,
                                      sum: templateViewObject.totalAmount,
                                      date: templateViewObject.date,
                                      comment: templateViewObject.comment)
        interactor.performSaveOperationRequest(with: operationPO)
    }
    
}
extension OperationCreationPresenter: OperationCreationOutputViewProtocol {
    
    func viewDidLoad(_ viewObject: CashFlowTableViewCellViewObject?) {
        self.operationViewObject = viewObject
        if let operationViewObject = operationViewObject as? OperationViewObject {
            templateViewObject = templateViewObjectMapper.map(operationViewObject)
        }
        fillViewObjectsToShow()
    }
    
    func didSelectRowAt(_ type: CashFlowTableViewCellTypeProtocol) {
        switch type {
        case .categoryButton:
            router.openCategoryList()
        case .saveButton:
            creationNewOperationWith()
        default:
            break
        }
    }
    
    func configureSelected(viewObject: CashFlowTableViewCellViewObject) {
        if let categoryViewObject = viewObject as? CategoryListViewObject {
            templateViewObject.categoryName = categoryViewObject.name
            fillViewObjectsToShow()
        }
    }
    
    func datePickerValueChanged(date: Date) {
        templateViewObject.date = date
    }
    
    func totalAmountValueChanged(totalAmount: Int) {
        templateViewObject.totalAmount = totalAmount
    }
    
    func segmentedControlValueChanged(_ segmentedIndex: Int) {
        let type: OperationType = segmentedIndex == 0 ? .expense : .income
        templateViewObject.type = type
    }
    
    func commentValueChanged(_ text: String) {
        templateViewObject.comment = text
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

