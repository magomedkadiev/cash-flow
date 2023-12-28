import Foundation

class CategoryCreationPresenter {
    
    weak var view: CategoryCreationInputViewProtocol?
    let router: ApplicationRouter
    var interactor: CategoryCreationInteractorInputProtocol
    fileprivate var categoryName: String = ""
    
    init(view: CategoryCreationInputViewProtocol, router: ApplicationRouter, interactor: CategoryCreationInteractorInputProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension CategoryCreationPresenter: CategoryCreationOutputViewProtocol {
    
    func viewDidLoad() {
        var viewObjects = [[CashFlowTableViewCellViewObject]]()
        
        var parentCategorySection = [CashFlowTableViewCellViewObject]()
        var categoryCreationSection = [CashFlowTableViewCellViewObject]()
        
        let parentCategoryViewObject = CategoryCreationParentCategoryViewObject(parentCategoryTitleName: "name")
        let categoryCreationSetTitleNameViewObject = CategoryCreationSetTitleNameViewObject(titleName: "111")
        
        parentCategorySection.append(parentCategoryViewObject)
        categoryCreationSection.append(categoryCreationSetTitleNameViewObject)
        
        viewObjects.append(contentsOf: [parentCategorySection, categoryCreationSection])
        view?.showInfo(viewObjects)
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
        let categoryPO = CategoryPO(id: UUID().uuidString, name: categoryName, parentID: "")
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
}
