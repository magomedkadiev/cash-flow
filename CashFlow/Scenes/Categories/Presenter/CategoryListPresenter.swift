import Foundation

class CategoryListPresenter {
    
    weak var view: CategoryListInputViewProtocol?
    var interactor: CategoryListinteractorInputProtocol
    
    init(view: CategoryListInputViewProtocol, interactor: CategoryListinteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension CategoryListPresenter: CategoryListOutputViewProtocol {
    func viewDidLoad() {
        // some work with db
        var viewObjects = [CashFlowTableViewCellViewObject]()
        
        viewObjects.append(CategoryListViewObject())
        
        view?.showInfo(viewObjects)
    }
}

extension CategoryListPresenter: CategoryListinteractorOutputProtocol {
    
}
