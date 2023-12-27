import Foundation

class CategoryCreationPresenter {
    
    weak var view: CategoryCreationInputViewProtocol?
    
    init(view: CategoryCreationInputViewProtocol) {
        self.view = view
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
}

extension CategoryCreationPresenter: CategoryCreationInteractorOutputProtocol {
    
}
