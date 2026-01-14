import Foundation

class CategoryCreationPresenter {
    
    weak var view: CategoryCreationInputViewProtocol?
    let router: ApplicationRouter
    var interactor: CategoryCreationInteractorInputProtocol
    var templateViewObject: CategoryCreationTemplateViewObject
    var templateViewObjectMapper: CategoryCreationToCategoryCreationTemplateViewObjectMapper
    
    init(view: CategoryCreationInputViewProtocol, router: ApplicationRouter, interactor: CategoryCreationInteractorInputProtocol, templateViewObject: CategoryCreationTemplateViewObject, templateViewObjectMapper: CategoryCreationToCategoryCreationTemplateViewObjectMapper) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.templateViewObject = templateViewObject
        self.templateViewObjectMapper = templateViewObjectMapper
    }
    
    private func fillViewObjectsToShow() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        
        var parentCategorySection = [CashFlowTableViewCellViewObject]()
        var categoryCreationSection = [CashFlowTableViewCellViewObject]()
        
        let parentCategoryViewObject = CategoryCreationParentCategoryViewObject(parentCategoryTitleName: templateViewObject.parentCategoryName)
        let categoryCreationSetTitleNameViewObject = CategoryCreationSetTitleNameViewObject(titleName: templateViewObject.name)
        
        if !templateViewObject.parentID.isEmpty || parentCategoryViewObject.parentCategoryTitleName.isEmpty {
            parentCategorySection.append(parentCategoryViewObject)
        }
        categoryCreationSection.append(categoryCreationSetTitleNameViewObject)
        
        viewObjects.append(contentsOf: [parentCategorySection, categoryCreationSection])
        view?.showInfo(viewObjects)
    }
}

extension CategoryCreationPresenter: CategoryCreationOutputViewProtocol {
    
    func viewDidLoad(_ viewObject: CashFlowTableViewCellViewObject?) {
        if let categoryViewObject = viewObject as? CategoryListViewObject {
            templateViewObject = templateViewObjectMapper.map(categoryViewObject)
        }
        fillViewObjectsToShow()
    }
    
    func didSelectItemEvent(_ viewObject: CashFlowTableViewCellViewObject) {
        switch viewObject.cellType {
        case .categoryCreationParent:
            router.openCategoryParentList()
        default:
            break
        }
    }
    
    func createCategoryEvent(_ viewObject: CashFlowTableViewCellViewObject?) {
        guard !templateViewObject.name.isEmpty else {
            print("categoryName isEpmty")
            return
        }
        
        let categoryPO = CategoryPO(id: templateViewObject.id.isEmpty ? UUID().uuidString : templateViewObject.id,
                                    name: templateViewObject.name,
                                    parentID: templateViewObject.parentID,
                                    subCategories: [])
        
        if let existingCategory = viewObject as? CategoryListViewObject {
            if let existingSubCategory = existingCategory.subCategories.first,
               existingSubCategory.parentID != templateViewObject.parentID {
                interactor.replaceParentCategory(oldID: existingSubCategory.parentID, newCategory: categoryPO)
            }
        } else {
                interactor.performsaveCategoryRequest(categoryPO)
        }
    }
}

extension CategoryCreationPresenter: CategoryCreationInteractorOutputProtocol {
    
    func operationCreationFinished() {
        DispatchQueue.main.async {
            self.router.dismiss()
            self.view?.categoryCreationFinished()
        }
    }
    
    func updateCategoryName(_ text: String) {
        templateViewObject.name = text
    }
    
    func updateParentCategoryName(_ viewObject: CashFlowTableViewCellViewObject) {
        guard let categoryParentViewObject = viewObject as? CategoryParentListViewObject else {
            return
        }
        self.templateViewObject.parentCategoryName = categoryParentViewObject.name
        self.templateViewObject.parentID = categoryParentViewObject.id
        fillViewObjectsToShow()
    }
}
