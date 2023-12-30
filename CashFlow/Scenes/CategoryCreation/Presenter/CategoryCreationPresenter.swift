import Foundation

class CategoryCreationPresenter {
    
    weak var view: CategoryCreationInputViewProtocol?
    let router: ApplicationRouter
    var interactor: CategoryCreationInteractorInputProtocol
    
    fileprivate var categoryName: String = ""
    fileprivate var categoryParentViewObject: CategoryParentListViewObject?
    
    init(view: CategoryCreationInputViewProtocol, router: ApplicationRouter, interactor: CategoryCreationInteractorInputProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    private func fillViewObjectsToShow() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        
        var parentCategorySection = [CashFlowTableViewCellViewObject]()
        var categoryCreationSection = [CashFlowTableViewCellViewObject]()
        
        let parentCategoryViewObject = CategoryCreationParentCategoryViewObject(parentCategoryTitleName: categoryParentViewObject?.name ?? "")
        let categoryCreationSetTitleNameViewObject = CategoryCreationSetTitleNameViewObject(titleName: "111")
        
        parentCategorySection.append(parentCategoryViewObject)
        categoryCreationSection.append(categoryCreationSetTitleNameViewObject)
        
        viewObjects.append(contentsOf: [parentCategorySection, categoryCreationSection])
        view?.showInfo(viewObjects)
    }
}

extension CategoryCreationPresenter: CategoryCreationOutputViewProtocol {
    
    func viewDidLoad() {
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
    
    func createCategoryWith() {
        guard !categoryName.isEmpty else {
            print("categoryName isEpmty")
            return
        }
        
        let categoryPO = CategoryPO(id: UUID().uuidString, name: categoryName, parentID: categoryParentViewObject?.parentID ?? "", subCategories: [])
        interactor.performsaveCategoryRequest(categoryPO)
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
        categoryName = text
    }
    
    func updateParentCategoryName(_ viewObject: CashFlowTableViewCellViewObject) {
        guard let categoryParentViewObject = viewObject as? CategoryParentListViewObject else {
            return
        }
        self.categoryParentViewObject = categoryParentViewObject
        fillViewObjectsToShow()
    }
}
