import Foundation

class CategoryListPresenter {
    
    weak var view: CategoryListInputViewProtocol?
    var interactor: CategoryListinteractorInputProtocol
    let router: ApplicationRouter
    
    init(view: CategoryListInputViewProtocol, interactor: CategoryListinteractorInputProtocol, router: ApplicationRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CategoryListPresenter: CategoryListOutputViewProtocol {
    
    func viewDidLoad() {
        // some work with db
        var viewObjects = [CashFlowTableViewCellViewObject]()
        
        let shopCategoryViewObject = OperationCreationCategoryViewObject(name: "Супермаркет")
        let shopCategoryViewObject1 = OperationCreationCategoryViewObject(name: "Еда вне дома")
        let shopCategoryViewObject2 = OperationCreationCategoryViewObject(name: "Такси")
        let shopCategoryViewObject3 = OperationCreationCategoryViewObject(name: "Здоровье")

        viewObjects.append(shopCategoryViewObject)
        viewObjects.append(shopCategoryViewObject1)
        viewObjects.append(shopCategoryViewObject2)
        viewObjects.append(shopCategoryViewObject3)

        view?.showInfo(viewObjects)
    }
    
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject) {
        router.dismissCategoryListViewController(viewObject)
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
}
