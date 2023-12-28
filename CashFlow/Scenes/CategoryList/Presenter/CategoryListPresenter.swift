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
    
    private func fillViewObjectsToShow(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        guard let viewObjects = viewObjects as? [CategoryListViewObject] else {
            return
        }
        view?.showInfo(viewObjects)

        
        
//        var viewObjects = [CategoryListViewObject]()
        
        //TODO: Сохранять в бд. Добавить возможность добавлять новые категории. Сохранять значение выбранного элемента.
//        viewObjects = [
//            CategoryListViewObject(name: "Еда вне дома", subCategories: [
//                CategoryListViewObject(name: "Кофейни"),
//                CategoryListViewObject(name: "Рестораны"),
//                CategoryListViewObject(name: "Обед")
//            ]),
//            CategoryListViewObject(name: "Автомобиль", subCategories: [
//                CategoryListViewObject(name: "Топливо"),
//                CategoryListViewObject(name: "Штрафы")
//            ]),
//            CategoryListViewObject(name: "Продукты питания")
//        ]

    }
}

extension CategoryListPresenter: CategoryListOutputViewProtocol {
    
    func viewDidLoad() {
//        fillViewObjectsToShow()
        fetchAllCategories()
//        interactor.fetchAllCategories()
        
    }
    
    func fetchAllCategories() {
        interactor.fetchAllCategories()
    }
    
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject) {
        router.dismiss()
    }
    
    func isReadyForEditing() -> Bool {
        if (router.getChildrenViewController() as? OperationCreationViewController) != nil {
            return false
        }
        return true
    }
    
    func addButtonTapped() {
        router.openCategoryCreationScreen()
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
    func reloadDataWith(_ mappedObjects: [CashFlowTableViewCellViewObject]) {
        fillViewObjectsToShow(mappedObjects)
    }
}
