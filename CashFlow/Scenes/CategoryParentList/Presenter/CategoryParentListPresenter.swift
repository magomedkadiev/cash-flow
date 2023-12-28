import Foundation

class CategoryParentListPresenter {
    
    weak var view: CategoryParentListInputViewProtocol?
    var interactor: CategoryParentListInteractorInputProtocol?
    
    init(view: CategoryParentListInputViewProtocol?) {
        self.view = view
    }
}

extension CategoryParentListPresenter: CategoryParentListOutputViewProtocol {
    
    func viewDidLoad() {
        interactor?.fetchAllCategories()
    }
}

extension CategoryParentListPresenter: CategoryParentListInteractorOutputProtocol {
    
    func reloadDataWith(_ viewObjects: [CashFlowTableViewCellViewObject]) {
        view?.showInfo(viewObjects)
    }
}
