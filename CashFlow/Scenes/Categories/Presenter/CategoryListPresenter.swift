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
        
        viewObjects.append(CategoryListViewObject())
        
        view?.showInfo(viewObjects)
    }
    
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject) {
        router.dismissCategoryListViewController(viewObject)
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
}
