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
        var viewObjects = [CategoryListViewObject]()
        
        //TODO: Сохранять в бд. Добавить возможность добавлять новые категории. Сохранять значение выбранного элемента.
        viewObjects = [
            CategoryListViewObject(name: "Еда вне дома", subCategories: [
                CategoryListViewObject(name: "Кофейни"),
                CategoryListViewObject(name: "Рестораны"),
                CategoryListViewObject(name: "Обед")
            ]),
            CategoryListViewObject(name: "Автомобиль", subCategories: [
                CategoryListViewObject(name: "Топливо"),
                CategoryListViewObject(name: "Штрафы")
            ]),
            CategoryListViewObject(name: "Продукты питания")
        ]

        view?.showInfo(viewObjects)
    }
    
    func dismissViewController(with viewObject: CashFlowTableViewCellViewObject) {
        router.dismiss()
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
}
